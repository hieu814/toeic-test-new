import 'package:toeic_test/presentation/category_screen/widgets/category_widget.dart';
import 'package:toeic_test/presentation/word_category_screen/widgets/category_widget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class WordCategoryScreen extends StatelessWidget {
  bool isFetch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray10001,
        appBar: CustomAppBar(
            backgroundColor: Colors.white,
            height: getVerticalSize(66),
            title: AppbarTitle(
                text: "lbl_Vocabulary".tr, margin: getMargin(left: 16)),
            actions: []),
        body: GetBuilder<WordCategoryController>(
            init: WordCategoryController(),
            builder: (controller) {
              if (!isFetch) {
                controller.callFetchCategory();
                isFetch = true;
              }
              return Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Obx(() => ListView.separated(
                            separatorBuilder: (context, index) {
                              return Padding(
                                  padding: getPadding(top: 14.5, bottom: 14.5),
                                  child: SizedBox(
                                      width: getHorizontalSize(326),
                                      child: Divider(
                                          height: getVerticalSize(1),
                                          thickness: getVerticalSize(1),
                                          color: ColorConstant.black9000c01)));
                            },
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              final exam = controller.categories[index];
                              return WordCategoryItemWidget(
                                onTap: () {
                                  Get.toNamed(AppRoutes.examCategoryScreen,
                                      arguments: {"category": exam});
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
                  ));
            }),
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
