import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/domain/firebase/firebase.dart';

import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/widgets/app_bar/appbar_image.dart';
import 'package:toeic_test/widgets/app_bar/appbar_title.dart';
import 'package:toeic_test/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                backgroundColor: ColorConstant.whiteA700,
                height: getVerticalSize(65),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 16, bottom: 15),
                    onTap: onTapArrowleft5),
                actions: [
                  // IconButton(
                  //   onPressed: () async {
                  //     await FirebaseAuthHelper().signOut();
                  //     Get.offNamed(AppRoutes.loginScreen);
                  //   },
                  //   icon: Icon(
                  //     Icons.logout,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
                title: AppbarTitle(
                    text: "lbl_profile".tr, margin: getMargin(left: 12))),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(top: 36, bottom: 36),
                  child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(left: 16),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          url: controller.user.value.avatar ==
                                                      null ||
                                                  controller.user.value.avatar!
                                                      .isEmpty
                                              ? "https://sangtao.sawaco.com.vn/wwwimages/Avatar/defaultavatar.png"
                                              : controller.user.value.avatar,
                                          height: getSize(72),
                                          width: getSize(72),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(36)),
                                          onTap: () {
                                            onTapImgProfilepicture();
                                          }),
                                      Padding(
                                          padding: getPadding(all: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    controller
                                                            .user.value.name ??
                                                        "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsBold14Indigo900
                                                        .copyWith(
                                                            fontSize: 20,
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.5))),
                                                GestureDetector(
                                                  onTap: () async {
                                                    _showPopupText(
                                                            context, "Name")
                                                        .then((value) async {
                                                      if (value != null) {
                                                        await controller
                                                            .updateProfile({
                                                          "name": value
                                                        });
                                                      }
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        getPadding(left: 5),
                                                    child: Icon(Icons.edit),
                                                  ),
                                                )
                                                // Padding(
                                                //     padding: getPadding(top: 8),
                                                //     child: Obx(() => Text(
                                                //         controller.user.value
                                                //                 .intro ??
                                                //             "",
                                                //         overflow: TextOverflow
                                                //             .ellipsis,
                                                //         textAlign:
                                                //             TextAlign.left,
                                                //         style: AppStyle
                                                //             .txtPoppinsRegular12
                                                //             .copyWith(
                                                //                 letterSpacing:
                                                //                     getHorizontalSize(
                                                //                         0.5)))))
                                              ]))
                                    ])),
                            Container(
                                width: double.maxFinite,
                                margin: getMargin(top: 32),
                                padding: getPadding(
                                    left: 16, top: 15, right: 16, bottom: 15),
                                decoration: AppDecoration.fillWhiteA700,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgLightbulb,
                                          height: getSize(24),
                                          width: getSize(24)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 2, bottom: 3),
                                          child: Text("lbl_gender".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsBold12Indigo900
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.5)))),
                                      Spacer(),
                                      Padding(
                                          padding:
                                              getPadding(top: 2, bottom: 3),
                                          child: Text(
                                              controller.user.value.gender ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.5)))),
                                      GestureDetector(
                                        onTap: () async {
                                          _showPopupGender(context)
                                              .then((value) async {
                                            if (value != null) {
                                              await controller.updateProfile(
                                                  {"gender": value});
                                            }
                                          });
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin: getMargin(left: 16)),
                                      )
                                    ])),
                            Container(
                                width: double.maxFinite,
                                padding: getPadding(
                                    left: 16, top: 15, right: 16, bottom: 15),
                                decoration: AppDecoration.fillWhiteA700,
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgMail24x24,
                                      height: getSize(24),
                                      width: getSize(24)),
                                  Padding(
                                      padding: getPadding(
                                          left: 16, top: 2, bottom: 3),
                                      child: Text("lbl_email".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsBold12Indigo900
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(0.5)))),
                                  Spacer(),
                                  Padding(
                                      padding: getPadding(top: 4, bottom: 1),
                                      child: Obx(() => Text(
                                          controller.user.value.email ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular12
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.5))))),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: getSize(24),
                                      width: getSize(24),
                                      margin: getMargin(left: 16))
                                ])),
                            Container(
                                width: double.maxFinite,
                                padding: getPadding(
                                    left: 16, top: 15, right: 16, bottom: 15),
                                decoration: AppDecoration.fillWhiteA700,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgMobile,
                                          height: getSize(24),
                                          width: getSize(24)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 2, bottom: 3),
                                          child: Text("lbl_phone_number".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsBold12Indigo900
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.5)))),
                                      Spacer(),
                                      Padding(
                                          padding:
                                              getPadding(top: 2, bottom: 3),
                                          child: Text(
                                              controller.user.value.phone ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.5)))),
                                      GestureDetector(
                                        onTap: () async {
                                          _showPopupText(context, "Phone")
                                              .then((value) async {
                                            if (value != null) {
                                              await controller.updateProfile(
                                                  {"phone": value});
                                            }
                                          });
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin: getMargin(left: 16)),
                                      )
                                    ])),
                            if (!Get.find<ApiClient>()
                                .currentUser
                                .isSocialLogin)
                              GestureDetector(
                                  onTap: () {
                                    onTapChangepassword();
                                  },
                                  child: Container(
                                      width: double.maxFinite,
                                      margin: getMargin(bottom: 5),
                                      padding: getPadding(
                                          left: 16,
                                          top: 15,
                                          right: 16,
                                          bottom: 15),
                                      decoration: AppDecoration.fillWhiteA700,
                                      child: Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgLock24x24,
                                            height: getSize(24),
                                            width: getSize(24)),
                                        Padding(
                                            padding: getPadding(
                                                left: 16, top: 4, bottom: 1),
                                            child: Text(
                                                "lbl_change_password".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsBold12Indigo900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.5)))),
                                        Spacer(),
                                        Padding(
                                            padding:
                                                getPadding(top: 3, bottom: 3),
                                            child: Text("msg".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.5)))),
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright,
                                            height: getSize(24),
                                            width: getSize(24),
                                            margin: getMargin(left: 16))
                                      ]))),
                            GestureDetector(
                                onTap: () async {
                                  await FirebaseAuthHelper().signOut();
                                  Get.offNamed(AppRoutes.loginScreen);
                                },
                                child: Container(
                                    width: double.maxFinite,
                                    margin: getMargin(bottom: 5),
                                    padding: getPadding(
                                        left: 16,
                                        top: 15,
                                        right: 16,
                                        bottom: 15),
                                    decoration: AppDecoration.fillWhiteA700,
                                    child: Row(children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 4, bottom: 1),
                                          child: Text("lbl_Sign_out".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsBold12Indigo900
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.5)))),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(left: 16))
                                    ])))
                          ]))),
            )));
  }

  onTapImgProfilepicture() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  onTapChangepassword() {
    Get.toNamed(AppRoutes.changePasswordScreen);
  }

  onTapArrowleft5() {
    Get.back();
  }
}

Future<String> _showPopupText(BuildContext context, String title) async {
  TextEditingController _textEditingController = TextEditingController();
  String enteredText = '';

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(hintText: ''),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              enteredText = _textEditingController.text;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

  return enteredText;
}

Future<String> _showPopupGender(BuildContext context) async {
  String selectedGender = '';

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Gender'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Male'),
              onTap: () {
                selectedGender = 'Male';
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Female'),
              onTap: () {
                selectedGender = 'Female';
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Other'),
              onTap: () {
                selectedGender = 'Other';
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );

  return selectedGender;
}
