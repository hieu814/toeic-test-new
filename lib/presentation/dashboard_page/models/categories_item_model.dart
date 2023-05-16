import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';

Map<int, String> subtitles = {
  0: "48 questions",
  1: "200 questions",
  2: "lbl_Photographs",
  3: "lbl_Question_Response",
  4: "lbl_Conversations",
  5: "lbl_Talks",
  6: "lbl_Incomplete_Sentences",
  7: "lbl_Text_Completion",
  8: "lbl_Passages",
};

class CategoriesItemModel {
  Rx<String> categoryPartTxt = Rx("lbl_man_shirt".tr);
  int? part = 1;
  String? id = "";
  String? image = "";
  String? subTitle = "";
  Color? color;
  CategoriesItemModel({
    this.part = 1,
    this.id = "",
  }) {
    categoryPartTxt = Rx("lbl_toeic_part_type_${part ?? 1}".tr);
    image = ImageConstant().getCategoryPartImage(part ?? 1);
    subTitle = part != null ? subtitles[part] ?? "" : "";
  }
}
