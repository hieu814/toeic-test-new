import '../controller/word_learning_controller.dart';
import 'package:get/get.dart';

class WordLearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordLearningController());
  }
}
