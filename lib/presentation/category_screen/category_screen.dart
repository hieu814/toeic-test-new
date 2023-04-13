import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/category_screen/widgets/exam_item_widget.dart';

import '../category_screen/widgets/offer_screen_item_widget.dart';
import 'controller/category_controller.dart';
import 'models/offer_screen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class CategoryScreen extends GetWidget<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(52),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, bottom: 2),
                    onTap: onTapArrowleft),
                title: AppbarTitle(text: "".tr, margin: getMargin(left: 12)),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 16, right: 16, bottom: 2),
                      onTap: onTapSearch)
                ]),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConstant.whiteA700,
                      ColorConstant.whiteA700,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 16, top: 41, right: 16, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(206),
                                  width: getHorizontalSize(343),
                                  child: Obx(
                                      () => Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                CustomImageView(
                                                    fit: BoxFit.fill,
                                                    url: controller
                                                        .category.value.image,
                                                    height:
                                                        getVerticalSize(206),
                                                    width:
                                                        getHorizontalSize(343),
                                                    radius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                5)),
                                                    alignment:
                                                        Alignment.center),
                                                Align(
                                                    child: Padding(
                                                        padding: getPadding(
                                                            left: 24),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            209),
                                                                    child: Text(
                                                                        controller
                                                                            .category
                                                                            .value
                                                                            .name,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtPoppinsBold24
                                                                            .copyWith(letterSpacing: getHorizontalSize(0.5)))),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                5),
                                                                    child: Flexible(
                                                                        // Use Flexible to wrap the Column
                                                                        child: Text(controller.category.value.description, textAlign: TextAlign.left, style: AppStyle.txtPoppinsBold14WhiteA700.copyWith(letterSpacing: getHorizontalSize(0.07)))))
                                                              ]),
                                                        )))
                                              ]))),
                              SizedBox(
                                height: 1000,
                                child: Obx(() => ListView.builder(
                                    itemCount: controller.exams.length,
                                    itemBuilder: (context, index) {
                                      final exam = controller.exams[index];
                                      return ExamItemWidget(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.examTestScreen,
                                              arguments: exam);
                                        },
                                        title: exam.name,
                                        subtitle: exam.description,
                                        author: "",
                                        publishDate: "",
                                        readDuration: "",
                                        thumbnail: CustomImageView(
                                          url: ApiConstant.getFileUrl(
                                              exam.image),
                                          height: getSize(
                                            133,
                                          ),
                                          width: getSize(
                                            133,
                                          ),
                                          radius: BorderRadius.circular(
                                            getHorizontalSize(
                                              5,
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                              )
                            ]))))));
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
