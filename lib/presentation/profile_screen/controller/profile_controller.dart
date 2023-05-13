import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/presentation/profile_screen/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  UserSchema getMeResp = UserSchema(scoreStatistics: []);

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await this.callFetchMe();
      _onFetchMeSuccess();
    } on GetMeResp {
      _onFetchMeError();
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
      getMeResp = await Get.find<ApiClient>().fetchMe();
      _handleFetchMeSuccess();
    } catch (e) {
      rethrow;
    }
  }

  void _handleFetchMeSuccess() {
    profileModelObj.value.usernameTxt.value = getMeResp.username ?? "";
    profileModelObj.value.emailOneTxt.value = getMeResp.email ?? "";
    profileModelObj.value.nameTxt.value = getMeResp.name ?? "";
  }

  void _onFetchMeSuccess() {}
  void _onFetchMeError() {}
}
