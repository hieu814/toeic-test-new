import 'package:toeic_test/presentation/test_result_screen/widgets/score_widget.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import '../dashboard_page/widgets/categories_item_widget.dart';
import 'controller/dashboard_controller.dart';
import 'models/categories_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            appBar: CustomAppBar(
                backgroundColor: Colors.white,
                height: getVerticalSize(66),
                title: AppbarTitle(
                    text: "lbl_home".tr, margin: getMargin(left: 16)),
                actions: []),
            body: SizedBox(
                width: size.width,
                child: GetBuilder<DashboardController>(
                    init: DashboardController(),
                    builder: (controller) {
                      controller.getUser();
                      return SingleChildScrollView(
                          child: Padding(
                              padding: getPadding(all: 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: getPadding(right: 16),
                                      child: Center(
                                        child: Container(
                                          margin: getMargin(all: 5),
                                          width: double.infinity,
                                          decoration: AppDecoration
                                              .fillWhiteA700
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder20),
                                          child: Obx(() => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        getPadding(all: 18),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Welcome back,",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular12
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.5))),
                                                          Text(
                                                              (controller
                                                                          .currentUser
                                                                          .value
                                                                          .name ??
                                                                      "")
                                                                  .trim(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsBold14Indigo900
                                                                  .copyWith(
                                                                      fontSize:
                                                                          20)),
                                                        ]),
                                                  ),
                                                  // Padding(
                                                  //   padding:
                                                  //       getPadding(right: 18),
                                                  //   child: ScoreCardWidget(
                                                  //     estimatedScore: controller
                                                  //             .toeicScore
                                                  //             .value
                                                  //             .listeningScore +
                                                  //         controller
                                                  //             .toeicScore
                                                  //             .value
                                                  //             .readingScore,
                                                  //     readingScore: controller
                                                  //         .toeicScore
                                                  //         .value
                                                  //         .readingScore,
                                                  //     listeningScore: controller
                                                  //         .toeicScore
                                                  //         .value
                                                  //         .listeningScore,
                                                  //     score: controller
                                                  //             .toeicScore
                                                  //             .value
                                                  //             .listeningScore +
                                                  //         controller
                                                  //             .toeicScore
                                                  //             .value
                                                  //             .readingScore,
                                                  //     total: 990,
                                                  //   ),
                                                  // ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),

                                    // full test
                                    GestureDetector(
                                        onTap: () async {
                                          print("-----");

                                          await controller.getAll();

                                          // onTapRowflashsale();
                                        },
                                        child: Padding(
                                            padding:
                                                getPadding(top: 23, right: 16),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("lbl_pactice".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsBold14Indigo900
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.5))),
                                                ]))),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(
                                            right: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: getPadding(
                                                    all: 10,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .categoryScreen,
                                                          arguments: {
                                                            "type": CategoryType
                                                                .miniTest
                                                          });
                                                    },
                                                    child: Container(
                                                      height: 150,
                                                      decoration: AppDecoration
                                                          .fillWhiteA700
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder10,
                                                              color: ColorConstant
                                                                  .yellow700
                                                                  .withOpacity(
                                                                      0.5)),
                                                      child: Padding(
                                                        padding: getPadding(
                                                          all: 20,
                                                        ),
                                                        child: FittedBox(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 9,
                                                                        bottom:
                                                                            9),
                                                                child: Column(
                                                                  children: [
                                                                    CustomImageView(
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          100,
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgMiniTest,
                                                                    ),
                                                                    Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              9,
                                                                          bottom:
                                                                              9),
                                                                      child:
                                                                          Text(
                                                                        "lbl_toeic_part_type_1"
                                                                            .tr,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: AppStyle
                                                                            .txtRubikMedium18
                                                                            .copyWith(
                                                                          fontSize:
                                                                              getFontSize(
                                                                            30,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: getPadding(
                                                    all: 10,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .categoryScreen,
                                                          arguments: {
                                                            "type": CategoryType
                                                                .fullTest
                                                          });
                                                    },
                                                    child: Container(
                                                      height: 150,
                                                      decoration: AppDecoration
                                                          .fillWhiteA700
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder10,
                                                              color: ColorConstant
                                                                  .lightBlueA200
                                                                  .withOpacity(
                                                                      0.5)),
                                                      child: Padding(
                                                        padding: getPadding(
                                                          all: 20,
                                                        ),
                                                        child: FittedBox(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 9,
                                                                        bottom:
                                                                            9),
                                                                child: Column(
                                                                  children: [
                                                                    CustomImageView(
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          100,
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgFullTest,
                                                                    ),
                                                                    Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              9,
                                                                          bottom:
                                                                              9),
                                                                      child:
                                                                          Text(
                                                                        "lbl_toeic_part_type_0"
                                                                            .tr,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: AppStyle
                                                                            .txtRubikMedium18
                                                                            .copyWith(
                                                                          fontSize:
                                                                              getFontSize(
                                                                            30,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    // -- full test
                                    // listening category
                                    Padding(
                                        padding: getPadding(top: 25, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("lbl_listening".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsBold14Indigo900
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.5))),
                                            ])),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            height: getVerticalSize(150),
                                            child: Obx(() => ListView.separated(
                                                padding: getPadding(top: 10),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height:
                                                          getVerticalSize(1));
                                                },
                                                itemCount: controller
                                                    .dashboardModelObj
                                                    .value
                                                    .categoriesListeningItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  CategoriesItemModel model =
                                                      controller
                                                              .dashboardModelObj
                                                              .value
                                                              .categoriesListeningItemList[
                                                          index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .examCategoryScreen,
                                                          arguments: {
                                                            "type": model.part
                                                          });
                                                    },
                                                    child: CategoriesItemWidget(
                                                      height: 100,
                                                      width: 150,
                                                      image: model.image ?? "",
                                                      backgroundColor: model
                                                              .color ??
                                                          Colors.green
                                                              .withOpacity(0.1),
                                                      subTitle:
                                                          (model.subTitle ?? "")
                                                              .tr,
                                                      title: model
                                                              .categoryPartTxt
                                                              .value ??
                                                          "",
                                                    ),
                                                  );
                                                })))),
                                    // -- listening category
                                    // reading category
                                    Padding(
                                        padding: getPadding(top: 25, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("lbl_reading".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsBold14Indigo900
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.5))),
                                            ])),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            height: getVerticalSize(150),
                                            child: Obx(() => ListView.separated(
                                                padding: getPadding(top: 10),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      height:
                                                          getVerticalSize(12));
                                                },
                                                itemCount: controller
                                                    .dashboardModelObj
                                                    .value
                                                    .categoriesReadingItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  CategoriesItemModel model =
                                                      controller
                                                              .dashboardModelObj
                                                              .value
                                                              .categoriesReadingItemList[
                                                          index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppRoutes
                                                              .examCategoryScreen,
                                                          arguments: {
                                                            "type": model.part
                                                          });
                                                    },
                                                    child: CategoriesItemWidget(
                                                      height: 100,
                                                      width: 150,
                                                      image: model.image ?? "",
                                                      backgroundColor: model
                                                              .color ??
                                                          Colors.green
                                                              .withOpacity(0.1),
                                                      subTitle:
                                                          (model.subTitle ?? "")
                                                              .tr,
                                                      title: model
                                                              .categoryPartTxt
                                                              .value ??
                                                          "",
                                                    ),
                                                  );
                                                })))),
                                    // -- reading category
                                  ])));
                    }))));
  }

  onTapTxtMorecategorylin() {
    Get.toNamed(AppRoutes.listCategoryScreen);
  }

  onTapRowflashsale() {
    Get.toNamed(AppRoutes.examCategoryScreen);
  }

  onTapMegasaleheader() {
    Get.toNamed(AppRoutes.examCategoryScreen);
  }

  onTapTxtSearchproduct() {}
  onTapDownload() {}
  onTapNotification() {}

  onTapCategorys() {}
  onTapMegaSaleProduct() {
// TODO: implement Actions
  }
}
