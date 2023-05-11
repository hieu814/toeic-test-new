import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';
import 'package:toeic_test/data/models/exam/result.dart';

class TestResultController extends GetxController {
  RxBool isSubmited = RxBool(false);
  Rx<Score> score = Rx<Score>(Score());
  Rx<ExamModel> exam = ExamModel().obs;
  RxList<GroupQuestionModel> questions = RxList([]);
  Rx<Map<int, String>> answers = Rx<Map<int, String>>({});
  Rx<Map<int, List<Answer>>> answersData = Rx<Map<int, List<Answer>>>({});
  Rx<Result> result = Rx<Result>(Result());
  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      answers.value = {};

      final arg = Get.arguments as ExamModel;
      result.value = arg.result ?? Result();
      score.value = result.value.getScore();
      Map<int, List<Answer>> _answerData = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: [],
        7: [],
      };

      for (var answer in result.value.answers) {
        _answerData[answer.type]?.add(answer);
      }

      answersData.value = _answerData;
      print("hieu: ${answersData}");
      exam.value = arg;
    } catch (e) {
      print(e);
      Get.rawSnackbar(message: "Cannot get datass");
    }
  }

  Future<void> getExam(String? examID) async {
    try {
      final response = await Get.find<ApiClient>()
          .requestGet("${ApiConstant.exams}/$examID");
      final data = (response['data'] ?? {}) as Map<String, dynamic>;
      exam.value = ExamModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
