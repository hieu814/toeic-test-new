import 'dart:math';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/custom_button.dart';
import 'package:toeic_test/widgets/custom_icon_button.dart';
import 'package:toeic_test/widgets/custom_text_form_field.dart';
import 'package:toeic_test/data/models/login/post_login_req.dart';
import 'package:toeic_test/data/models/login/post_login_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toeic_test/domain/googleauth/google_auth_helper.dart';
import 'package:toeic_test/domain/facebookauth/facebook_auth_helper.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 68, right: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconButton(
                          height: 72,
                          width: 72,
                          variant: IconButtonVariant.FillLightblueA200,
                          shape: IconButtonShape.RoundedBorder16,
                          padding: IconButtonPadding.PaddingAll20,
                          child: CustomImageView(
                              svgPath: ImageConstant.imgCloseWhiteA700)),
                      Padding(
                          padding: getPadding(top: 16),
                          child: Text("msg_welcome_to_e_co".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold16.copyWith(
                                  letterSpacing: getHorizontalSize(0.5)))),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("msg_sign_in_to_cont".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular12.copyWith(
                                  letterSpacing: getHorizontalSize(0.5)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.emailController,
                          hintText: "lbl_your_email".tr,
                          margin: getMargin(top: 28),
                          padding: TextFormFieldPadding.PaddingT14,
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 10, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgMail)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.passwordController,
                          hintText: "lbl_password".tr,
                          margin: getMargin(top: 10),
                          padding: TextFormFieldPadding.PaddingT14,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 10, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLock)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48)),
                          isObscureText: true),
                      CustomButton(
                          height: getVerticalSize(57),
                          text: "lbl_sign_in".tr,
                          margin: getMargin(top: 16),
                          onTap: onTapSignin),
                      Padding(
                          padding: getPadding(top: 18),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 10, bottom: 9),
                                    child: SizedBox(
                                        width: getHorizontalSize(134),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blue50))),
                                Text("lbl_or".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsBold14.copyWith(
                                        letterSpacing:
                                            getHorizontalSize(0.07))),
                                Padding(
                                    padding: getPadding(top: 10, bottom: 9),
                                    child: SizedBox(
                                        width: getHorizontalSize(137),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blue50)))
                              ])),
                      GestureDetector(
                          onTap: () {
                            onTapRowgoogle();
                          },
                          child: Container(
                              margin: getMargin(top: 16),
                              padding: getPadding(
                                  left: 7, top: 16, right: 7, bottom: 16),
                              decoration: AppDecoration.outlineBlue50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgGoogle,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1)),
                                Padding(
                                    padding:
                                        getPadding(left: 72, top: 2, bottom: 1),
                                    child: Text("msg_login_with_goog".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsBold14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.5))))
                              ]))),
                      GestureDetector(
                          onTap: () {
                            onTapRowfacebook();
                          },
                          child: Container(
                              margin: getMargin(top: 8),
                              padding: getPadding(
                                  left: 7, top: 16, right: 7, bottom: 16),
                              decoration: AppDecoration.outlineBlue50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgFacebook,
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 1)),
                                Padding(
                                    padding:
                                        getPadding(left: 64, top: 2, bottom: 1),
                                    child: Text("msg_login_with_face".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsBold14
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.5))))
                              ]))),
                      Padding(
                          padding: getPadding(top: 17),
                          child: Text("msg_forgot_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold12.copyWith(
                                  letterSpacing: getHorizontalSize(0.5)))),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDonthaveana();
                          },
                          child: Padding(
                              padding: getPadding(top: 7, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_a2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.blueGray300,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing:
                                                getHorizontalSize(0.5))),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.indigoA200,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing:
                                                getHorizontalSize(0.5))),
                                    TextSpan(
                                        text: "lbl_register".tr,
                                        style: TextStyle(
                                            color: ColorConstant.lightBlueA200,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing:
                                                getHorizontalSize(0.5)))
                                  ]),
                                  textAlign: TextAlign.left)))
                    ]))));
  }

  Future<void> onTapSignin() async {
    PostLoginReq postLoginReq = PostLoginReq(
      username: controller.emailController.text,
      password: controller.passwordController.text,
    );
    try {
      await controller.callCreateLogin(
        postLoginReq.toJson(),
      );
      _onOnTapSignInSuccess();
    } on PostLoginResp {
      _onOnTapSignInError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onOnTapSignInSuccess() {
    Get.offNamed(AppRoutes.dashboardContainerScreen);
  }

  void _onOnTapSignInError() {
    Fluttertoast.showToast(
      msg: "Invalid username or password!",
    );
  }

  onTapRowgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        print("---------------------googleUser ${googleUser}");
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      print(onError.toString());
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapRowfacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtDonthaveana() {
    Get.toNamed(AppRoutes.registerFormScreen);
  }
}
