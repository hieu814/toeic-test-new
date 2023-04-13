import '../controller/exam_test_controller.dart';
import 'package:get/get.dart';

class ExamTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }
}
