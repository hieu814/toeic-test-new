import 'package:toeic_test/widgets/category_widget.dart';

import 'controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class CategoryScreen extends GetWidget<CategoryController> {
  @override
  String getTitle(CategoryType type) {
    switch (type) {
      case CategoryType.article:
        return "lbl_article";
      case CategoryType.fullTest:
        return "lbl_toeic_part_type_0";
      case CategoryType.miniTest:
        return "lbl_toeic_part_type_1";
      case CategoryType.word:
        return "lbl_word_learning";
      default:
        return "";
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray10001,
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
                  "${getTitle(controller.categoryType.value)}".tr,
                  style: TextStyle(color: Colors.black),
                )),
            actions: []),
        body: Container(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final exam = controller.categories[index];
                        return CategoryItemWidget(
                          onTap: () {
                            int type = controller.categoryType.value ==
                                    CategoryType.miniTest
                                ? ExamType.fullMiniTest
                                : ExamType.fullTest;
                            Get.toNamed(AppRoutes.examCategoryScreen,
                                arguments: {"category": exam, "type": type});
                          },
                          thumbnail: exam.image,
                          title: exam.name,
                          subtitle: exam.description,
                          count: "",
                          typeName: "Exam",
                        );
                      })),
                ),
              ],
            )),
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
