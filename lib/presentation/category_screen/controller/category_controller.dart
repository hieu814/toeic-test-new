import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/category_screen/models/category_model.dart';

class CategoryController extends GetxController {
  Rx<CategoryModel> categoryModelObj = CategoryModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
