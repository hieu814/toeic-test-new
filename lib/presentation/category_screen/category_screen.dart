import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/category_screen/widgets/category_widget.dart';
import 'controller/category_controller.dart';
import 'models/offer_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class CategoryScreen extends GetWidget<CategoryController> {
  @override
  String getTitle(CategoryType type) {
    switch (type) {
      case CategoryType.article:
        return "lbl_article";
      case CategoryType.fullTest:
        return "lbl_toeic_part_0";
      case CategoryType.miniTest:
        return "lbl_toeic_part_1";
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
        appBar: AppBar(
          title:
              Obx(() => Text("${getTitle(controller.categoryType.value)}".tr)),
        ),
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
                            Get.toNamed(AppRoutes.examCategoryScreen,
                                arguments: {"category": exam});
                          },
                          thumbnail: CustomImageView(
                            url: exam.image,
                            fit: BoxFit.fill,
                            radius: BorderRadiusStyle.roundedBorder10,
                          ),
                          title: exam.name,
                          subtitle: exam.description,
                          author: "author",
                          count: "100",
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
