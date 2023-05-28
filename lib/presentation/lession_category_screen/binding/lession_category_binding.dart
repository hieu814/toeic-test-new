import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

import 'package:get/get.dart';
import 'package:toeic_test/presentation/lession_category_screen/controller/lession_controller.dart';

class LessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessionCategoryController());
  }
}
