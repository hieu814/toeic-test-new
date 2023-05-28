import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/domain/firebase/firebase.dart';

import 'controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';
import 'package:toeic_test/widgets/custom_button.dart';
import 'package:toeic_test/widgets/custom_text_form_field.dart';

class ChangePasswordScreen extends GetWidget<ChangePasswordController> {
  @override //lbl_change_password
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(52),
                backgroundColor: Colors.white,
                leadingWidth: 50,
                leading: Padding(
                    padding: getPadding(all: 8),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    )),
                title: Text(
                  "lbl_change_password".tr,
                  style: TextStyle(color: Colors.black),
                ),
                actions: []),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 26, right: 16, bottom: 26),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("lbl_old_password".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsBold14Indigo900
                              .copyWith(letterSpacing: getHorizontalSize(0.5))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.oldpasswordOneController,
                          hintText: "msg".tr,
                          margin: getMargin(top: 12),
                          variant: TextFormFieldVariant.OutlineBlue50_1,
                          padding: TextFormFieldPadding.PaddingT14,
                          fontStyle:
                              TextFormFieldFontStyle.PoppinsBold12Bluegray300,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 10, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLock)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Text("lbl_new_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold14Indigo900
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.5)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.newpasswordOneController,
                          hintText: "msg".tr,
                          margin: getMargin(top: 12),
                          variant: TextFormFieldVariant.OutlineBlue50_1,
                          padding: TextFormFieldPadding.PaddingT14,
                          fontStyle:
                              TextFormFieldFontStyle.PoppinsBold12Bluegray300,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 10, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLock)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48))),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Text("msg_new_password_ag".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold14Indigo900
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.5)))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.newpasswordagaiTwoController,
                          hintText: "msg".tr,
                          margin: getMargin(top: 11, bottom: 5),
                          variant: TextFormFieldVariant.OutlineBlue50_1,
                          padding: TextFormFieldPadding.PaddingT14,
                          fontStyle:
                              TextFormFieldFontStyle.PoppinsBold12Bluegray300,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 12, right: 10, bottom: 12),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgLock)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(48)))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(57),
                text: "lbl_save".tr,
                margin: getMargin(left: 16, right: 16, bottom: 50),
                onTap: onTapSave)));
  }

  onTapSave() async {
    await controller.changePass().then((value) async {
      if (value["status"] != null && value["status"] != "SUCCESS") {
        Get.rawSnackbar(message: value["message"] ?? "");
      } else {
        await FirebaseAuthHelper().signOut();
      }
    });
  }

  onTapArrowleft6() {
    Get.back();
  }
}
