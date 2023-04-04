import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:toeic_test/core/app_export.dart';
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
      postLoginResp = await FirebaseAuthHelper()
          .signInWithEmailAndPassword(req['username'], req['password']);
    } catch (e) {
      throw e;
    }
  }

  Future<void> callCreateLoginGoogle() async {
    try {
      postLoginResp = await FirebaseAuthHelper().googleSignInProcess();
    } catch (e) {
      throw e;
    }
  }

  Future<void> callCreateLoginFacebook() async {
    try {
      postLoginResp = await FirebaseAuthHelper().signInWithFacebook();
    } catch (e) {
      throw e;
    }
  }

  void _handleCreateLoginSuccess() {
    Get.find<PrefUtils>()
        .setToken(postLoginResp!.credential!.accessToken ?? "");
  }
}
