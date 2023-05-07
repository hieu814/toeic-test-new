import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/exam_category_screen/models/category_model.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

class ExamCategoryController extends GetxController {
  RxList<ExamModel> exams = RxList([]);
  Rx<CategoryItemModel> category = CategoryItemModel().obs;
  List<Result> results = [];
  @override
  void onReady() async {
    super.onReady();
    final args = Get.arguments as Map<String, dynamic>;
    category.value = args["category"] as CategoryItemModel;
    await callFetchResult();
    await callFetchExams();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> callFetchExams() async {
    try {
      List<ExamModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 100,
        "queryField": {"category": category.value.id},
      });

      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.exams}/list", query);
      final data = (response['data']['data'] ?? []) as List<dynamic>;
      list.assignAll(data.map((item) => ExamModel.fromJson(item)).toList());
      for (var i = 0; i < list.length; i++) {
        list[i].result = findResult(list[i].id);
      }
      exams.value = list;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> callFetchResult() async {
    try {
      List<Result> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 100,
        "queryField": {"addedBy": Get.find<ApiClient>().currentUser.id},
      });

      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.result}/list", query);
      if (response['data'] != null) {
        final data = (response['data']['data'] ?? []) as List<dynamic>;
        list.assignAll(data.map((item) => Result.fromJson(item)).toList());
      }

      results = list;
    } catch (e) {
      rethrow;
    }
  }

  Result? findResult(String examid) {
    for (var element in results) {
      if (element.examId == examid) return element;
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
