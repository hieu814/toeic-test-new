import 'dart:async';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/user/User.dart';

class TestController extends GetxController {
  RxBool isSubmited = RxBool(false);
  RxBool isTip = RxBool(false);
  RxBool isFirstTest = RxBool(true);
  Rx<ExamModel> exam = ExamModel().obs;
  RxList<GroupQuestionModel> questions = RxList([]);
  Rx<Map<int, String>> answers = Rx<Map<int, String>>({});
  Rx<GroupQuestionModel> currentQuesttion = GroupQuestionModel().obs;
  RxString time = RxString("00:00:00");
  GetMeResp getMeResp = GetMeResp();
  int currentIndex = 0;
  Rx<Map<int, List<Answer>>> answersData = Rx<Map<int, List<Answer>>>({});
  Rx<Result> result = Rx<Result>(Result());
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      answers.value = {};
      final arg = Get.arguments as ExamModel;
      if (arg.result != null) {
        isFirstTest.value = arg.retest;
        result.value = arg.result ?? Result();
        if (!arg.retest) {
          for (var e in result.value.answers!) {
            selectAnswer(e.type, e.number, e.answer);
          }
        }
      }

      await getExam(arg.id);
      List<Map<String, dynamic>> answ = [];
      int totalReading = 0;
      int totalListening = 0;
      for (var groupQuestion in exam.value.questions) {
        for (var question in groupQuestion.questions) {
          if (groupQuestion.type < 5)
            totalListening++;
          else
            totalReading++;
          answ.add({
            'type': groupQuestion.type,
            'number': question.number,
            'answer': answers.value[question.number] ?? "",
            "correct_answer": question.correctAnswer
          });
        }
      }

      result.value.examId = exam.value.id;
      result.value.answers = Result.fromJson({"answers": answ}).answers;
      result.value = arg.result ?? Result();
      Map<int, List<Answer>> _answerData = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: [],
        7: [],
      };
      if (result.value.answers.length == 0) {
        List<Map<String, dynamic>> answ = [];
        for (var groupQuestion in exam.value.questions) {
          for (var question in groupQuestion.questions) {
            answ.add({
              'type': groupQuestion.type,
              'number': question.number,
              'answer': answers.value[question.number] ?? "",
              "correct_answer": question.correctAnswer
            });
          }
        }
        result.value.examId = exam.value.id;
        result.value.answers = Result.fromJson({"answers": answ}).answers;
      }
      for (var answer in result.value.answers) {
        _answerData[answer.type]?.add(answer);
      }
      answersData.value = _answerData;
      startTimer(exam.value.type);
    } catch (e) {
      Get.rawSnackbar(message: "Cannot get data");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectAnswer(int type, int question, String answer) {
    for (Answer answerData in answersData.value[type] ?? []) {
      if (answerData.number == question) {
        answerData.answer = answer;
      }
    }
    answers.value[question] = answer;
  }

  void selectAnswerSheet(int questionNumber) {
    isTip.value = false;
    int index = 0;
    for (var groupquestion in exam.value.questions) {
      for (var question in groupquestion.questions) {
        if (question.number == questionNumber) {
          currentQuesttion.value = groupquestion;
          currentIndex = index;
          return;
        }
      }
      index++;
    }
  }

  void startTimer(int type) {
    int totalTime;

    if (type == 0) {
      // 2 hours
      totalTime = 7200;
    } else if (type == 1) {
      // 30 minutes
      totalTime = 1800;
    } else {
      // No time limit
      totalTime = -1;
      time.value = "";
      return;
    }

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalTime == 0) {
        timer.cancel();
        time.value = "00:00:00";
        submit().then((value) {
          Get.offNamed(AppRoutes.examTestResultScreen, arguments: exam.value);
        });
      } else if (totalTime > 0) {
        totalTime--;
        int hours = totalTime ~/ 3600;
        int minutes = (totalTime % 3600) ~/ 60;
        int seconds = totalTime % 60;
        String formattedTime =
            '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        time.value = formattedTime;
      }
    });
  }

  double calculateTimePerQuestion(int totalTime, int numQuestions) {
    return totalTime / numQuestions;
  }

  Future<void> submit() async {
    // isSubmited.value = true;
    List<Map<String, dynamic>> answ = [];
    for (var groupQuestion in exam.value.questions) {
      for (var question in groupQuestion.questions) {
        answ.add({
          'type': groupQuestion.type,
          'number': question.number,
          'answer': answers.value[question.number] ?? "",
          "correct_answer": question.correctAnswer
        });
      }
    }
    result.value.examId = exam.value.id;
    if (result.value.id == null || result.value.id!.isEmpty) {
      UserSchema currentUser = await Get.find<ApiClient>().fetchMe();
      result.value.userId = currentUser.id;
    }

    result.value.answers = Result.fromJson({"answers": answ}).answers;
    exam.value.result = result.value;
    if (exam.value.result != null && exam.value.result!.getScore().blank > 0) {
      return;
    }
    final response = await Get.find<ApiClient>().requestPostorPut(
        "${ApiConstant.result}/${result.value.id == null || result.value.id!.isEmpty ? "create" : "update/${result.value.id}"}",
        result.value.toJson());

    if (response["data"] != null && response["data"] is List<dynamic>) {
      final data = response["data"] as List<dynamic>;
      if (data.length > 0) {
        exam.value.result = Result.fromJson(data[0]);
      }
    } else if (response["data"] != null &&
        response["data"] is Map<String, dynamic>) {
      exam.value.result = Result.fromJson(response["data"]);
    }
    if (!isFirstTest.value) await updateScoreStatics();
  }

  Future<void> updateScoreStatics() async {
    try {
      UserSchema currentUser = await Get.find<ApiClient>().fetchMe();
      answersData.value.forEach((key, value) {
        int _type = key;
        int _count = 0;
        int _correct = 0;
        List<Answer> answers = value;
        for (var answ in answers) {
          if (answ.answer.isNotEmpty &&
              ['A', 'B', 'C', 'D'].contains(answ.answer)) {
            _count++;
            if (answ.answer == answ.correctAnswer) _correct++;
          }
        }
        // print("hieu answe  ${{
        //   "type": _type,
        //   "_count": _count,
        //   "_correct": _correct
        // }}");

        for (var i = 0; i < currentUser.scoreStatistics.length; i++) {
          if (currentUser.scoreStatistics[i].type == _type) {
            currentUser.scoreStatistics[i].count =
                currentUser.scoreStatistics[i].count + _count;
            currentUser.scoreStatistics[i].totalCorrect =
                currentUser.scoreStatistics[i].totalCorrect + _correct;
          }
        }
      });
      if ((currentUser.id ?? "").isNotEmpty) {
        final response = await Get.find<ApiClient>().requestPostorPut(
            "${ApiConstant.user}/update/${currentUser.id}",
            {"score_statistics": currentUser.toJson()["score_statistics"]});
        print("hieu update resutr ${response}");
      }
    } catch (e) {
      print("hieu error  ${e}");
      rethrow;
    }
  }

  Future<void> getExam(String? examID) async {
    try {
      List<ExamModel> list = [];

      final response = await Get.find<ApiClient>()
          .requestGet("${ApiConstant.exams}/${examID}");

      final data = (response['data'] ?? []) as Map<String, dynamic>;
      print(data);
      exam.value = ExamModel.fromJson(data);
      currentQuesttion.value = exam.value.questions[0];
    } catch (e) {
      rethrow;
    }
  }

  void onNext() async {
    isTip.value = false;
    currentIndex++;
    if (currentIndex < exam.value.questions.length) {
      currentQuesttion.value = exam.value.questions[currentIndex];
    } else {
      currentIndex = exam.value.questions.length - 1;
    }
  }

  void onBack() async {
    isTip.value = false;
    currentIndex--;
    if (currentIndex >= 0) {
      currentQuesttion.value = exam.value.questions[currentIndex];
    } else {
      currentIndex = 0;
    }
  }
}
