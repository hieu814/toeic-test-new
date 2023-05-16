import '../controller/dashboard_controller.dart';
import '../models/categories_item_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/custom_icon_button.dart';

class CategoriesItemWidget extends StatelessWidget {
  const CategoriesItemWidget(
      {Key? key,
      required this.backgroundColor,
      required this.title,
      required this.image,
      required this.width,
      required this.height,
      required this.subTitle})
      : super(key: key);
  final Color backgroundColor;
  final String image;
  final String title;
  final String subTitle;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: (width ?? 0) * 0.8,
            height: (height ?? 0) * 0.8,
            decoration: AppDecoration.fillBlueA400.copyWith(
                color: backgroundColor,
                borderRadius: BorderRadiusStyle.roundedBorder5),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: image,
                    width: (height ?? 0) * 0.5,
                    height: (height ?? 0) * 0.5,
                  ),
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRubikMedium12.copyWith(
                          fontSize: 20, letterSpacing: getHorizontalSize(0.2))),
                ])),
        Padding(
          padding: getPadding(top: 5, left: 10, right: 10),
          child: Container(
            width: (width ?? 0) * 0.8,
            child: Text(subTitle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: AppStyle.txtRubikMedium12.copyWith(
                    fontSize: 15, letterSpacing: getHorizontalSize(0.2))),
          ),
        ),
        Spacer()
      ],
    );
  }
}
