import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toeic_test/core/utils/progress_dialog_utils.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/domain/firebase/firebase.dart';
import 'package:toeic_test/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  UserCredential? postLoginResp;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> callCreateLogin(Map req) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      postLoginResp = await FirebaseAuthHelper()
          .signInWithEmailAndPassword(req['username'], req['password']);
      await _handleCreateLoginSuccess();
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      throw e;
    }
  }

  Future<void> callCreateLoginGoogle() async {
    try {
      ProgressDialogUtils.showProgressDialog();
      postLoginResp = await FirebaseAuthHelper().googleSignInProcess();
      await _handleCreateLoginSuccess();
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      throw e;
    }
  }

  Future<void> callCreateLoginFacebook() async {
    try {
      ProgressDialogUtils.showProgressDialog();
      postLoginResp = await FirebaseAuthHelper().signInWithFacebook();
      await _handleCreateLoginSuccess();
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      ProgressDialogUtils.hideProgressDialog();
      throw e;
    }
  }

  Future<void> _handleCreateLoginSuccess() async {
    try {
      final idtoken = await postLoginResp?.user?.getIdToken();
      final res = await Get.find<ApiClient>().getTokenFromServer(idtoken ?? "");
      UserSchema user = UserSchema.fromJson(res["data"]);
      Get.find<ApiClient>().setCurrentUser(user);
      String _token = res["data"]?["token"] ?? "";
      if (_token.isNotEmpty) {
        await Get.find<PrefUtils>().setToken(_token);
      } else {
        throw "Cannot access server";
      }
    } catch (e) {
      throw "Cannot access server: $e";
    }
  }
}
