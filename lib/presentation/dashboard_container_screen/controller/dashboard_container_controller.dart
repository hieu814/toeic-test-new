import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/dashboard_container_screen/models/dashboard_container_model.dart';
import 'package:toeic_test/widgets/custom_bottom_bar.dart';

class DashboardContainerController extends GetxController {
  // var token = Get.arguments[NavigationArgs.token];

  // var id = Get.arguments[NavigationArgs.id];

  Rx<DashboardContainerModel> dashboardContainerModelObj =
      DashboardContainerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {}
}
