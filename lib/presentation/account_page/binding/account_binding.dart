import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';

import '../controller/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
