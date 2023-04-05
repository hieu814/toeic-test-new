import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/presentation/dashboard_page/models/dashboard_model.dart';

class DashboardController extends GetxController {
  DashboardController(this.dashboardModelObj);

  Rx<DashboardModel> dashboardModelObj;

  Rx<int> silderIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<Map<String, dynamic>> callFetchExamCategory() async {
    try {
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 10,
      });
      return Get.find<ApiClient>()
          .requestPost("/device/api/v1/exam_category/list", query);
    } catch (e) {
      rethrow;
    }
  }
}
