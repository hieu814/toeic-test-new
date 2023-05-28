import 'package:firebase_auth/firebase_auth.dart';
import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/register_form_screen/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:toeic_test/domain/firebase/firebase.dart';

class RegisterFormController extends GetxController {
  TextEditingController fullnameController = TextEditingController();

  TextEditingController youremailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordagainController = TextEditingController();

  Rx<RegisterFormModel> registerFormModelObj = RegisterFormModel().obs;

  UserCredential? postLoginResp;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    fullnameController.dispose();
    youremailController.dispose();
    passwordController.dispose();
    passwordagainController.dispose();
  }

  Future<void> callCreateRegister(Map req) async {
    try {
      postLoginResp = await FirebaseAuthHelper().signUp(req);
      print("postLoginResp $postLoginResp");
    } catch (e) {
      throw e;
    }
  }

  void _handleCreateRegisterSuccess() {
    Get.find<PrefUtils>()
        .setToken(postLoginResp!.credential!.accessToken ?? "");
  }
}
