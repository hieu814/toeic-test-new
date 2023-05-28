import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/lession_topic_screen/models/lession_model.dart';
import 'package:toeic_test/presentation/word_topic_screen/models/topic_model.dart';

class LessionController extends GetxController {
  Rx<LessionModel> topic = LessionModel().obs;
  RxInt index = RxInt(0);
  @override
  void onReady() {
    super.onReady();
    topic.value = Get.arguments as LessionModel;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
