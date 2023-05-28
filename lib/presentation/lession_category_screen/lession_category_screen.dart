import 'package:toeic_test/widgets/category_widget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'package:toeic_test/presentation/lession_category_screen/controller/lession_controller.dart';

class LessionCategoryScreen extends StatelessWidget {
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
                text: "lbl_Lession".tr, margin: getMargin(left: 16)),
            actions: []),
        body: GetBuilder<LessionCategoryController>(
            init: LessionCategoryController(),
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
                              final category = controller.categories[index];
                              return CategoryItemWidget(
                                onTap: () {
                                  Get.toNamed(AppRoutes.lessionTopicScreen,
                                      arguments: {"category": category});
                                },
                                thumbnail: category.image,
                                title: category.name,
                                subtitle: category.description,
                                count: "",
                                typeName: "Lession",
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
