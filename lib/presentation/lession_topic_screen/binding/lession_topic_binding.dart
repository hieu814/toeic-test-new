import '../controller/lession_topic_controller.dart';
import 'package:get/get.dart';

class LessionTopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessionTopicController());
  }
}
