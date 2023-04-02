import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/add_card_screen/models/add_card_model.dart';
import 'package:flutter/material.dart';

class AddCardController extends GetxController {
  TextEditingController entercardnumberOneController = TextEditingController();

  TextEditingController expirationdateOneController = TextEditingController();

  TextEditingController securitycodeOneController = TextEditingController();

  TextEditingController entercardnumberThreeController =
      TextEditingController();

  Rx<AddCardModel> addCardModelObj = AddCardModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    entercardnumberOneController.dispose();
    expirationdateOneController.dispose();
    securitycodeOneController.dispose();
    entercardnumberThreeController.dispose();
  }
}
