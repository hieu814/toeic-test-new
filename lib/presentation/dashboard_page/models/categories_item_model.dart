import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toeic_test/core/app_export.dart';

Map<int, String> subtitles = {
  ExamType.fullTest: "48 questions",
  ExamType.fullMiniTest: "200 questions",
  ExamType.part1: "lbl_Photographs",
  ExamType.part2: "lbl_Question_Response",
  ExamType.part3: "lbl_Conversations",
  ExamType.part4: "lbl_Talks",
  ExamType.part5: "lbl_Incomplete_Sentences",
  ExamType.part6: "lbl_Text_Completion",
  ExamType.part7: "lbl_Passages",
};
Map<int, Color> _color = {
  ExamType.fullTest: ColorConstant.fromHex('#fae4ec'),
  ExamType.fullMiniTest: ColorConstant.fromHex('#fae4ec'),
  ExamType.part1: ColorConstant.fromHex('#fae4ec'),
  ExamType.part2: ColorConstant.fromHex('#f6e4fc'),
  ExamType.part3: ColorConstant.fromHex('#eae4fd'),
  ExamType.part4: ColorConstant.fromHex('#e6e9fd'),
  ExamType.part5: ColorConstant.fromHex('#e5eefd'),
  ExamType.part6: ColorConstant.fromHex('#e6f5fe'),
  ExamType.part7: ColorConstant.fromHex('#e3fefe'),
};
// ColorConstant.fromHex('#fae4ec'),

class CategoriesItemModel {
  Rx<String> categoryPartTxt = Rx("lbl_man_shirt".tr);
  int? part = 1;

  String? image = "";
  String? subTitle = "";
  Color? color;
  CategoriesItemModel({
    this.part = 1,
  }) {
    categoryPartTxt = Rx("lbl_toeic_part_type_${part ?? 1}".tr);
    image = ImageConstant().getCategoryPartImage(part ?? 1);
    subTitle = part != null ? subtitles[part] ?? "" : "";
    color = part != null ? _color[part] : Colors.white;
  }
}
