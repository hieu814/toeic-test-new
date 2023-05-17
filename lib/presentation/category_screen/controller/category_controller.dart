import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/category_screen/models/category_model.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

class CategoryController extends GetxController {
  RxList<CategoryItemModel> categories = RxList([]);
  Rx<CategoryType> categoryType = Rx<CategoryType>(CategoryType.non);

  @override
  void onReady() {
    super.onReady();
    final args = Get.arguments as Map<String, dynamic>;
    categoryType.value = args["type"] as CategoryType;
    if (categoryType.value == CategoryType.fullTest) {
      callFetchFullTestExamCategory();
    } else if (categoryType.value == CategoryType.miniTest) {
      callFetchMiniTestExamCategory();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> callFetchFullTestExamCategory() async {
    try {
      List<CategoryItemModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 10,
        "queryField": {"type": 0},
      });
      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.examCategory}", query);
      final data = response['data']['data'] as List<dynamic>;
      list.assignAll(
          data.map((item) => CategoryItemModel.fromJson(item)).toList());
      categories.value = list;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> callFetchMiniTestExamCategory() async {
    try {
      List<CategoryItemModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 10,
        "queryField": {"type": 1},
      });
      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.examCategory}", query);
      final data = response['data']['data'] as List<dynamic>;
      print({"callFetchMiniTestExamCategory": data});
      list.assignAll(
          data.map((item) => CategoryItemModel.fromJson(item)).toList());
      categories.value = list;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> callFetchCategory() async {
    try {
      List<CategoryItemModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 10,
        "queryField": {"type": 0},
      });
      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.wordCategory}", query);
      final data = response['data']['data'] as List<dynamic>;
      list.assignAll(
          data.map((item) => CategoryItemModel.fromJson(item)).toList());
      categories.value = list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
