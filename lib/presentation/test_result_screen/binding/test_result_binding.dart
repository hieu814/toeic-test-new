import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

import '../controller/test_result_controller.dart';
import 'package:get/get.dart';

class TestResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestResultController());
  }
}
