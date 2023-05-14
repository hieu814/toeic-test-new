import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/presentation/exam_category_screen/widgets/exam_delegate.dart';
import 'package:toeic_test/presentation/exam_category_screen/widgets/exam_item_widget.dart';

import 'controller/category_controller.dart';

import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class ExamCategoryScreen extends GetWidget<ExamCategoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        appBar: CustomAppBar(
            height: getVerticalSize(52),
            backgroundColor: Colors.white,
            leadingWidth: 50,
            leading: Padding(
                padding: getPadding(all: 8),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                )),
            title: Obx(() => Text(
                  "${controller.category.value.name}".tr,
                  style: TextStyle(color: Colors.black),
                )),
            actions: []),
        body: Container(
            width: double.maxFinite,
            child: Obx(() => ListView.builder(
                itemCount: controller.exams.length,
                itemBuilder: (context, index) {
                  final exam = controller.exams[index];
                  final score = exam.result?.getScore() ?? Score();

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
                      lastTestDate: exam.result?.updatedAt!
                          .toLocal()
                          .toString()
                          .substring(0, 10),
                      score: score.correct,
                      total: exam.total,
                      name: exam.name,
                      type: "lbl_toeic_part_type_${exam.type}".tr,
                      totalQuestion: exam.total);
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
