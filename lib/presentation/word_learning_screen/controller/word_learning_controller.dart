import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/presentation/word_topic_screen/models/topic_model.dart';

class WordLearningController extends GetxController {
  Rx<TopicModel> topic = TopicModel(words: []).obs;
  @override
  void onReady() {
    super.onReady();
    topic.value = Get.arguments as TopicModel;
    print("hieu ${topic.value.toJson()}");
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
