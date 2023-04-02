import '../controller/review_exam_controller.dart';
import 'package:get/get.dart';

class ReviewExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewExamController());
  }
}
