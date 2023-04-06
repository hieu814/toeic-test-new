import '../controller/dashboard_controller.dart';
import '../models/exam_category_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

// ignore: must_be_immutable
class ExamCategoryItemWidget extends StatelessWidget {
  ExamCategoryItemWidget(this.examCategoryItemModelObj, {this.onTapProduct});

  ExamCategoryItemModel examCategoryItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTapProduct;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapProduct?.call();
          },
          child: Container(
            margin: getMargin(
              right: 16,
            ),
            padding: getPadding(
              all: 16,
            ),
            decoration: AppDecoration.outlineBlue501.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  url: ApiConstant.getFileUrl(
                      examCategoryItemModelObj.image ?? ""),
                  // imagePath: ImageConstant.imgProductimage109x1091,
                  height: getSize(
                    109,
                  ),
                  width: getSize(
                    109,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      5,
                    ),
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    105,
                  ),
                  margin: getMargin(
                    top: 7,
                  ),
                  child: Text(
                    examCategoryItemModelObj.name ?? "",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold12Indigo900.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 11,
                  ),
                  child: Text(
                    "${examCategoryItemModelObj.count ?? 0} ${"lbl_exam".tr}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold12.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
