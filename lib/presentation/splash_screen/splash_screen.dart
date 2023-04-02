import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.lightBlueA200,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: getSize(72),
                          width: getSize(72),
                          margin: getMargin(bottom: 5))
                    ]))));
  }
}
