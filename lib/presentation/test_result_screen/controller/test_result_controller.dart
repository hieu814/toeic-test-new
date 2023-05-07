import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/data/models/exam/result.dart';

class TestResultController extends GetxController {
  RxBool isSubmited = RxBool(false);
  Rx<Score> score = Rx<Score>(Score());
  Rx<ExamModel> exam = ExamModel().obs;
  RxList<GroupQuestionModel> questions = RxList([]);
  Rx<Map<int, String>> answers = Rx<Map<int, String>>({});
  Rx<Result> result = Rx<Result>(Result());
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      answers.value = {};
      final arg = Get.arguments as ExamModel;
      result.value = arg.result ?? Result();
      score.value = result.value.getScore();
    } catch (e) {
      Get.rawSnackbar(message: "Cannot get data");
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
