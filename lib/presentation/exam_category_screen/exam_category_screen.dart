import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/exam_category_screen/widgets/exam_delegate.dart';
import 'package:toeic_test/presentation/exam_category_screen/widgets/exam_item_widget.dart';

import 'controller/category_controller.dart';
import 'models/offer_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class ExamCategoryScreen extends GetWidget<ExamCategoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        appBar: AppBar(
          title: Obx(() => Text("${controller.category.value.name}".tr)),
        ),
        body: Container(
            width: double.maxFinite,
            child: Obx(() => ListView.builder(
                itemCount: controller.exams.length,
                itemBuilder: (context, index) {
                  final exam = controller.exams[index];
                  return ExamDelegate(
                      onTap: () {
                        if (exam.result != null) {
                          Get.toNamed(AppRoutes.examTestResultScreen,
                              arguments: exam);
                        } else {
                          Get.toNamed(AppRoutes.examTestScreen,
                              arguments: exam);
                        }
                      },
                      name: exam.name,
                      type: "lbl_toeic_part_${exam.type}".tr,
                      totalQuestion: exam.questions.length);
                }))),
      ),
    );
  }

  onTapProduct() {
    print("tap pp");
    // Get.toNamed(AppRoutes.examTestScreen, arguments: exam);
  }

  onTapArrowleft() {
    Get.back();
  }

  onTapSearch() {
// TODO: implement Actions
  }
}
