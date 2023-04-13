import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestController extends GetxController {
  Rx<ExamModel> exam = ExamModel().obs;
  RxList<GroupQuestionModel> questions = RxList([]);
  Rx<GroupQuestionModel> currentQuesttion = GroupQuestionModel().obs;
  RxString time = RxString("00:00:00");
  GetMeResp getMeResp = GetMeResp();
  int currentIndex = 0;
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final arg = Get.arguments as ExamModel;
      getExam(arg.id);
    } catch (e) {
      Get.rawSnackbar(message: "Cannot get data");
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  @override
  void onClose() {
    super.onClose();
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
      // print("sssss part $")
    } catch (e) {
      rethrow;
    }
  }

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
    currentIndex--;
    if (currentIndex >= 0) {
      currentQuesttion.value = exam.value.questions[currentIndex];
    } else {
      currentIndex = 0;
    }
  }
}
