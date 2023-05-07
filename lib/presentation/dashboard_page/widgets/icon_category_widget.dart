import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:toeic_test/core/app_export.dart';

class IconCategoryWidget extends StatelessWidget {
  const IconCategoryWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.backGroundColor,
    this.onTap,
  }) : super(key: key);
  final String name;
  final Widget icon;
  final Color backGroundColor;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        all: 5,
      ),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
              color: ColorConstant.gray10001.withOpacity(0.5)),
          child: Padding(
            padding: getPadding(
              all: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(top: 9, bottom: 9),
                  child: Row(
                    children: [
                      new CircularPercentIndicator(
                        radius: 34.0,
                        lineWidth: 4.0,
                        percent: 0.90,
                        center: new Text("90%"),
                        progressColor: Colors.green,
                      ),
                      Padding(
                        padding: getPadding(
                          left: 10,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(
                                    left: 10,
                                    top: 2,
                                    bottom: 1,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      name,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikMedium18,
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ]),
                      ),
                    ],
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
