import '../explore_page/widgets/explore1_item_widget.dart';
import '../explore_page/widgets/explore_item_widget.dart';
import 'controller/explore_controller.dart';
import 'models/explore1_item_model.dart';
import 'models/explore_item_model.dart';
import 'models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'package:toeic_test/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExploreController controller = Get.put(ExploreController(ExploreModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(67),
                title: CustomSearchView(
                    width: getHorizontalSize(263),
                    focusNode: FocusNode(),
                    controller: controller.searchController,
                    hintText: "lbl_search_product".tr,
                    margin: getMargin(left: 16),
                    prefix: Container(
                        margin:
                            getMargin(left: 16, top: 15, right: 8, bottom: 15),
                        child: CustomImageView(
                            svgPath: ImageConstant.imgSearchLightBlueA200)),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(46)),
                    suffix: Padding(
                        padding: EdgeInsets.only(right: getHorizontalSize(15)),
                        child: IconButton(
                            onPressed: () {
                              controller.searchController.clear();
                            },
                            icon: Icon(Icons.clear,
                                color: Colors.grey.shade600)))),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgDownload,
                      margin: getMargin(left: 16, top: 16, right: 16),
                      onTap: onTapDownload1),
                  Container(
                      height: getSize(24),
                      width: getSize(24),
                      margin: getMargin(left: 16, top: 16, right: 32),
                      child: Stack(alignment: Alignment.topRight, children: [
                        AppbarImage(
                            height: getSize(24),
                            width: getSize(24),
                            svgPath: ImageConstant.imgNotification,
                            onTap: onTapNotification1),
                        AppbarImage(
                            height: getSize(8),
                            width: getSize(8),
                            svgPath: ImageConstant.imgClose8x8,
                            margin: getMargin(left: 14, right: 2, bottom: 16))
                      ]))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 25, right: 16, bottom: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_man_fashion".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsBold14Indigo900
                              .copyWith(letterSpacing: getHorizontalSize(0.5))),
                      Padding(
                          padding: getPadding(top: 13),
                          child: Obx(() => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: getVerticalSize(93),
                                      crossAxisCount: 4,
                                      mainAxisSpacing: getHorizontalSize(21),
                                      crossAxisSpacing: getHorizontalSize(21)),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .exploreModelObj.value.exploreItemList.length,
                              itemBuilder: (context, index) {
                                ExploreItemModel model = controller
                                    .exploreModelObj
                                    .value
                                    .exploreItemList[index];
                                return ExploreItemWidget(model);
                              }))),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Text("lbl_woman_fashion".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold14Indigo900
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.5)))),
                      Padding(
                          padding: getPadding(top: 13),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: controller.exploreModelObj.value
                                  .explore1ItemList.length,
                              itemBuilder: (context, index) {
                                Explore1ItemModel model = controller
                                    .exploreModelObj
                                    .value
                                    .explore1ItemList[index];
                                return Explore1ItemWidget(model);
                              })))
                    ]))));
  }

  onTapDownload1() {
// TODO: implement Actions
  }
  onTapNotification1() {
// TODO: implement Actions
  }
}
