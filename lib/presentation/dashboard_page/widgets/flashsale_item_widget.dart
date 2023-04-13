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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstant.whiteA700,
                Color.fromARGB(255, 183, 236, 166),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              CustomImageView(
                url: ApiConstant.getFileUrl(CategoryItemModelObj.image ?? ""),
                fit: BoxFit.fill,
                height: getSize(
                  109,
                ),
                width: getSize(
                  109,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    10,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          CategoryItemModelObj.name,
                          maxLines: 4,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtPoppinsBold18Indigo900.copyWith(
                              // letterSpacing: getHorizontalSize(
                              //   0.5,
                              // ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
