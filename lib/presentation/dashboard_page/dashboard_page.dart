import '../dashboard_page/widgets/categories_item_widget.dart';
import '../dashboard_page/widgets/dashboard_item_widget.dart';
import '../dashboard_page/widgets/flashsale_item_widget.dart';
import '../dashboard_page/widgets/megasale_item_widget.dart';
import '../dashboard_page/widgets/sliderofferbannertitl_item_widget.dart';
import 'controller/dashboard_controller.dart';
import 'models/categories_item_model.dart';
import 'models/dashboard_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/category_item_model.dart';
import 'models/megasale_item_model.dart';
import 'models/sliderofferbannertitl_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            appBar: CustomAppBar(
                height: getVerticalSize(43),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(16),
                    width: getSize(16),
                    svgPath: ImageConstant.imgSearchLightBlueA200,
                    margin: getMargin(left: 32, top: 4, bottom: 4)),
                actions: []),
            body: SizedBox(
                width: size.width,
                child: GetBuilder<DashboardController>(
                    init: DashboardController(),
                    builder: (controller) {
                      // controller.getAll();
                      return SingleChildScrollView(
                          child: Padding(
                              padding: getPadding(left: 16, top: 43, bottom: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(right: 16),
                                        child: Obx(() => CarouselSlider.builder(
                                            options: CarouselOptions(
                                                height: getVerticalSize(206),
                                                initialPage: 0,
                                                autoPlay: true,
                                                viewportFraction: 1.0,
                                                enableInfiniteScroll: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                onPageChanged: (index, reason) {
                                                  controller.silderIndex.value =
                                                      index;
                                                }),
                                            itemCount: controller
                                                .dashboardModelObj
                                                .value
                                                .sliderofferbannertitlItemList
                                                .length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              SliderofferbannertitlItemModel
                                                  model = controller
                                                          .dashboardModelObj
                                                          .value
                                                          .sliderofferbannertitlItemList[
                                                      index];
                                              return SliderofferbannertitlItemWidget(
                                                  model);
                                            }))),
                                    Obx(() => Container(
                                        height: getVerticalSize(8),
                                        margin: getMargin(left: 135, top: 16),
                                        child: AnimatedSmoothIndicator(
                                            activeIndex:
                                                controller.silderIndex.value,
                                            count: controller
                                                .dashboardModelObj
                                                .value
                                                .sliderofferbannertitlItemList
                                                .length,
                                            axisDirection: Axis.horizontal,
                                            effect: ScrollingDotsEffect(
                                                spacing: 8,
                                                activeDotColor:
                                                    ColorConstant.lightBlueA200,
                                                dotColor: ColorConstant.blue50,
                                                dotHeight: getVerticalSize(8),
                                                dotWidth:
                                                    getHorizontalSize(8))))),
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
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            height: getVerticalSize(118),
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
                                                    .categoriesListeningItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  CategoriesItemModel model =
                                                      controller
                                                              .dashboardModelObj
                                                              .value
                                                              .categoriesListeningItemList[
                                                          index];
                                                  return CategoriesItemWidget(
                                                      model);
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
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            height: getVerticalSize(118),
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
                                                  return CategoriesItemWidget(
                                                      model);
                                                })))),
                                    // -- reading category
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
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: getPadding(
                                            all: 5,
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
                                                                        "lbl_toeic_part_1"
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
                                                                        "lbl_toeic_part_1"
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
