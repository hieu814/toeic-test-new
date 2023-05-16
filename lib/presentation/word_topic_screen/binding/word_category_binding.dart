import '../controller/word_topic_controller.dart';
import 'package:get/get.dart';

class WordTopiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordTopicController());
  }
}
