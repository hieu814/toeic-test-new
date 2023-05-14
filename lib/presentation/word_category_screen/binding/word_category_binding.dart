import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

import '../controller/category_controller.dart';
import 'package:get/get.dart';

class WordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordCategoryController());
  }
}
