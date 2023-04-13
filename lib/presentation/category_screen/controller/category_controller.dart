import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/category_screen/models/category_model.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

class CategoryController extends GetxController {
  RxList<ExamModel> exams = RxList([]);
  Rx<CategoryItemModel> category = CategoryItemModel().obs;
  int categoryType = 0;

  @override
  void onReady() {
    super.onReady();
    final args = Get.arguments as Map<String, dynamic>;
    category.value = args["category"] as CategoryItemModel;
    categoryType = args["type"] as int;
    callFetchExams();
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
      // print("------------------------- exams.value ${list.length}");
      exams.value = list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
