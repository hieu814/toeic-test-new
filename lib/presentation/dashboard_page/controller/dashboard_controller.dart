import 'dart:math';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/presentation/account_page/models/account_model.dart';
import 'package:toeic_test/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

class DashboardController extends GetxController {
  DashboardController();

  Rx<DashboardModel> dashboardModelObj = DashboardModel().obs;
  Rx<ToeicScore> toeicScore = Rx<ToeicScore>(ToeicScore());
  Rx<int> silderIndex = 0.obs;
  Rx<UserSchema> currentUser = Rx<UserSchema>(UserSchema(scoreStatistics: []));
  @override
  void onReady() async {
    super.onReady();
    await getUser();
    toeicScore.value = currentUser.value.getScoreStatics();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUser() async {
    currentUser.value = await Get.find<ApiClient>().fetchMe();
  }

  Future<void> getAll() async {
    await callFetchFullTestExamCategory();
    await callFetchMiniTestExamCategory();
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
      print({"callFetchFullTestExamCategory": data});
      list.assignAll(
          data.map((item) => CategoryItemModel.fromJson(item)).toList());
      dashboardModelObj.value.setFullTestCategoryItemList(list);
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
      dashboardModelObj.value.setMiniTestCategoryItemList(list);
    } catch (e) {
      rethrow;
    }
  }
}
