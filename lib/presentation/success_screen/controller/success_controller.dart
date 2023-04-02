import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/success_screen/models/success_model.dart';

class SuccessController extends GetxController {
  Rx<SuccessModel> successModelObj = SuccessModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
