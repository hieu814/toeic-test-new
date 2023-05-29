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
      startTimer(totalReading, totalListening);
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

  void startTimer(int numReadingQuestions, int numListeningQuestions) {
    int totalReading = 4500; // 75 minutes in seconds
    int totalListening = 2700; // 45 minutes in seconds
    double timePerReadingQuestion = (totalReading / 100) * numReadingQuestions;
    double timePerListeningQuestion =
        (totalListening / 100) * numListeningQuestions;

    int totalTime = (timePerReadingQuestion + timePerListeningQuestion).toInt();
    // print("hieu total ${totalListening}, $totalReading , time ${totalTime}");
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (totalTime <= 0) {
        timer.cancel();
        time.value = "00:00:00";
        submit().then((value) {
          Get.offNamed(AppRoutes.examTestResultScreen, arguments: exam.value);
        });
      } else {
        totalTime--;
        int minutes = totalTime ~/ 60;
        int remainingMinutes = minutes ~/ 60;
        int remainingSeconds = minutes % 60;
        String formattedTime =
            '${(remainingMinutes % 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}:${(totalTime % 60).toString().padLeft(2, '0')}';
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
    result.value.answers = Result.fromJson({"answers": answ}).answers;

    final response = await Get.find<ApiClient>().requestPostorPut(
        "${ApiConstant.result}/${result.value.id == null || result.value.id!.isEmpty ? "create" : "update/${result.value.id}"}",
        result.value.toJson());

    if (response["data"] != null && response["data"] is List<dynamic>) {
      final data = response["data"] as List<dynamic>;
      if (data.length > 0) {
        exam.value.result = Result.fromJson(data[0]);
        print(exam.value.result!.toJson());
      }
    } else if (response["data"] != null &&
        response["data"] is Map<String, dynamic>) {
      exam.value.result = Result.fromJson(response["data"]);
    } else {
      exam.value.result = result.value;
    }
    await updateScoreStatics();
  }

  Future<void> updateScoreStatics() async {
    try {
      UserSchema currentUser = await Get.find<ApiClient>().fetchMe();
      print("hieu ____ current  ${currentUser.toJson()}");
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
    currentIndex++;
    if (currentIndex < exam.value.questions.length) {
      currentQuesttion.value = exam.value.questions[currentIndex];
    } else {
      currentIndex = exam.value.questions.length - 1;
    }
  }

  void onBack() async {
    print("on back");
    currentIndex--;
    if (currentIndex >= 0) {
      currentQuesttion.value = exam.value.questions[currentIndex];
    } else {
      currentIndex = 0;
    }
  }
}
