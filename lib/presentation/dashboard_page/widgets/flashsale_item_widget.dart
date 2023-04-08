import '../controller/dashboard_controller.dart';
import '../models/category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

// ignore: must_be_immutable
class ExamCategoryItemWidget extends StatelessWidget {
  ExamCategoryItemWidget(this.CategoryItemModelObj, {this.onTap});

  CategoryItemModel CategoryItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          margin: getMargin(
            right: 10,
          ),
          // padding: getPadding(
          //   all: 10,
          // ),
          decoration: AppDecoration.outlineBlue501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                url: ApiConstant.getFileUrl(CategoryItemModelObj.image ?? ""),
                // imagePath: ImageConstant.imgProductimage109x1091,
                height: getSize(
                  109,
                ),
                width: getSize(
                  109,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    25,
                  ),
                ),
              ),
              Text(
                CategoryItemModelObj.name ?? "",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsBold18Indigo900.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.5,
                  ),
                ),
              )

              // Padding(
              //   padding: getPadding(
              //     top: 11,
              //   ),
              //   child: Text(
              //     "${CategoryItemModelObj.count ?? 0} ${"lbl_exam".tr}",
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.left,
              //     style: AppStyle.txtPoppinsBold12.copyWith(
              //       letterSpacing: getHorizontalSize(
              //         0.5,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
