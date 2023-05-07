import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestController extends GetxController {
  RxBool isSubmited = RxBool(false);
  Rx<ExamModel> exam = ExamModel().obs;
  RxList<GroupQuestionModel> questions = RxList([]);
  Rx<Map<int, String>> answers = Rx<Map<int, String>>({});
  Rx<GroupQuestionModel> currentQuesttion = GroupQuestionModel().obs;
  RxString time = RxString("00:00:00");
  GetMeResp getMeResp = GetMeResp();
  int currentIndex = 0;
  Result result = Result();
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      answers.value = {};
      final arg = Get.arguments as ExamModel;
      if (arg.result != null) {
        result = arg.result ?? Result();
        for (var e in result.answers!) {
          selectAnswer(e.number, e.answer);
        }
      }
      getExam(arg.id);
    } catch (e) {
      print("hieu ${e}");
      Get.rawSnackbar(message: "Cannot get data");
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectAnswer(int question, String answer) {
    print("hieu selectAnswer ${question} - ${answer}");
    answers.value[question] = answer;
  }

  void submit() async {
    print("submit");
    isSubmited.value = true;

    List<Map<String, dynamic>> answ = [];
    for (var groupQuestion in exam.value.questions) {
      for (var question in groupQuestion.questions) {
        answ.add({
          'number': question.number,
          'answer': answers.value[question.number] ?? "",
          "correct_answer": question.correctAnswer
        });
      }
    }
    print(answ);
    result.examId = exam.value.id;
    result.answers = Result.fromJson({"answers": answ}).answers;

    final response = await Get.find<ApiClient>()
        .requestPost("${ApiConstant.result}/create", result.toJson());
    print(response);
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

  // Future<void> callFetchResults() async {
  //   try {
  //     List<ExamModel> list = [];
  //     Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
  //       "page": 0,
  //       "rowsPerPage": 100,
  //       "queryField": {"category": category.value.id},
  //     });

  //     final response = await Get.find<ApiClient>()
  //         .requestPost("${ApiConstant.exams}/list", query);
  //     final data = (response['data']['data'] ?? []) as List<dynamic>;
  //     list.assignAll(data.map((item) => ExamModel.fromJson(item)).toList());
  //     // print("------------------------- exams.value ${list.length}");
  //     exams.value = list;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> getExamData(String? examID) async {
    // try {
    //   return APIService.requestGetOne(MyConfig.getUserDataAPI,
    //           locator<UserService>().currentUser.getUserID())
    //       .then((value) async {
    //     if (CommonFunction.checkHttpRespond(value)) {
    //       User user = User.fomJsonString(value.body);
    //       printInfo(info: value.body);
    //       for (var answer in user.answerSheets!) {
    //         if (answer.exam == examID) {
    //           _answerSheet.value = answer;
    //           // printInfo(info: "success ${answer.toJson()}");
    //           return;
    //         }
    //       }
    //     }
    //     _answerSheet.value = AnswerSheet(
    //         exam: examID,
    //         usersPermissionsUser:
    //             locator<UserService>().currentUser.getUserID());
    //     await _updateAnswerSheet(true);
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> _updateAnswerSheet(bool isnew) async {}

  Future<bool> initExamData() async {
    // printInfo(info: "initExamData()");
    // Map<String, dynamic> select = {};
    // try {
    //   printInfo(info: "initExamData1");
    //   // await getExamData(exam.value.id);
    //   printInfo(info: "initExamData2");
    //   _currentpart.value = exam.value.parts!.first;
    //   listquestion.clear();

    //   listquestion.sort((a, b) {
    //     int aq = a.questionMin ?? 0;
    //     int bq = b.questionMin ?? 0;
    //     return (aq > bq ? 1 : -1);
    //   });
    //   printInfo(info: "question len: ${listquestion.length}");
    //   currentIndex = 0;
    //   currentQuestion.value = listquestion[currentIndex];
    // } catch (e) {
    //   printInfo(info: "error: $e");
    // }
    // await _updateAnswerSheet(false);
    return true;
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
