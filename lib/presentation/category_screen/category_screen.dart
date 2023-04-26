import 'package:toeic_test/data/models/exam/exam.dart';
import 'package:toeic_test/presentation/category_screen/widgets/exam_delegate.dart';
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
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  223,
                ),
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.maxFinite,
                        margin: getMargin(
                          bottom: 60,
                        ),
                        padding: getPadding(
                          left: 26,
                          top: 24,
                          right: 26,
                          bottom: 24,
                        ),
                        decoration: AppDecoration.fillBlueA400.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL40,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: onTapArrowleft,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getVerticalSize(
                                  28,
                                ),
                                width: getHorizontalSize(
                                  24,
                                ),
                                margin: getMargin(
                                  bottom: 85,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 101,
                                bottom: 85,
                              ),
                              child: Text(
                                "lbl_category".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRubikMedium24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: getMargin(
                          left: 26,
                          right: 26,
                        ),
                        padding: getPadding(
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  controller.category.value.name,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRubikBold24.copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.2,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 18,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: ColorConstant.indigo50,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                  top: 15,
                                  right: 17,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        left: 6,
                                      ),
                                      child: Text(
                                        "${controller.exams.length} exams",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtRubikMedium14.copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    // CustomImageView(
                                    //   svgPath: ImageConstant.imgClock,
                                    //   height: getSize(
                                    //     18,
                                    //   ),
                                    //   width: getSize(
                                    //     18,
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: getPadding(
                                    //     left: 6,
                                    //   ),
                                    //   child: Text(
                                    //     "lbl_23h".tr,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     textAlign: TextAlign.left,
                                    //     style:
                                    //         AppStyle.txtRubikMedium14.copyWith(
                                    //       letterSpacing: getHorizontalSize(
                                    //         0.2,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    margin: getMargin(
                      left: 26,
                      top: 16,
                      right: 26,
                    ),
                    padding: getPadding(
                      top: 15,
                      bottom: 15,
                    ),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder20,
                    ),
                    child: SizedBox(
                      height: 1000,
                      child: Obx(() => ListView.builder(
                          itemCount: controller.exams.length,
                          itemBuilder: (context, index) {
                            final exam = controller.exams[index];
                            return ExamDelegate(
                                onTap: () {
                                  Get.toNamed(AppRoutes.examTestScreen,
                                      arguments: exam);
                                },
                                name: exam.name,
                                type: "lbl_toeic_part_${exam.type}".tr,
                                totalQuestion: exam.questions.length);
                          })),
                    )),
              ),
            ],
          ),
        ),
      ),
    );

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
