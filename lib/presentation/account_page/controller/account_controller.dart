import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/account_page/models/account_model.dart';

class AccountController extends GetxController {
  AccountController(this.accountModelObj);

  Rx<AccountModel> accountModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
