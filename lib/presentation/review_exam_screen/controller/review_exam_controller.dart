import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/review_exam_screen/models/review_exam_model.dart';

class ReviewExamController extends GetxController {
  Rx<ReviewExamModel> reviewExamModelObj = ReviewExamModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
