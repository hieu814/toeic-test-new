import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

import 'package:get/get.dart';
import 'package:toeic_test/presentation/exam_category_screen/controller/category_controller.dart';

class ExamCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamCategoryController());
  }
}
