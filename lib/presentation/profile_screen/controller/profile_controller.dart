import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  Rx<UserSchema> user = Rx<UserSchema>(UserSchema(scoreStatistics: []));

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await this.callFetchMe();
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> callFetchMe() async {
    try {
      user.value = await Get.find<ApiClient>().fetchMe();
    } catch (e) {
      rethrow;
    }
  }
}
