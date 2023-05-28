import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/presentation/change_password_screen/models/change_password_model.dart';
import 'package:flutter/material.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldpasswordOneController = TextEditingController();

  TextEditingController newpasswordOneController = TextEditingController();

  TextEditingController newpasswordagaiTwoController = TextEditingController();

  Rx<ChangePasswordModel> changePasswordModelObj = ChangePasswordModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<Map<String, dynamic>> changePass(
//!params.newPassword || !params.oldPassword) {
      ) async {
    try {
      final response = await Get.find<ApiClient>()
          .requestPut("${ApiConstant.user}/change-password", {
        "user": Get.find<ApiClient>().currentUser.toJson(),
        "newPassword": newpasswordOneController.text,
        "oldPassword": oldpasswordOneController.text
      });
      return response;
    } catch (e) {
      throw "Cannot access server: $e";
    }
  }

  @override
  void onClose() {
    super.onClose();
    oldpasswordOneController.dispose();
    newpasswordOneController.dispose();
    newpasswordagaiTwoController.dispose();
  }
}
