import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';

class CategoriesItemModel {
  Rx<String> categoryPartTxt = Rx("lbl_man_shirt".tr);
  int? part = 1;
  String? id = "";
  String? image = "";
  CategoriesItemModel({
    this.part = 1,
    this.id = "",
  }) {
    categoryPartTxt = Rx("lbl_toeic_part_type_${part ?? 1}".tr);
    image = ImageConstant().getCategoryPartImage(part ?? 1);
  }
}
