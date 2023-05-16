import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';
import 'package:toeic_test/presentation/word_topic_screen/models/topic_model.dart';

class WordTopicController extends GetxController {
  RxList<CategoryItemModel> categories = RxList([]);
  Rx<CategoryType> categoryType = Rx<CategoryType>(CategoryType.non);
  Rx<CategoryItemModel> category = CategoryItemModel().obs;
  RxList<TopicModel> topics = RxList<TopicModel>([]);
  @override
  void onReady() {
    super.onReady();
    final args = Get.arguments as Map<String, dynamic>;
    category.value = args["category"] as CategoryItemModel;
    print(" hieu ${category.value.id}");
    callFetchTopic();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> callFetchTopic() async {
    try {
      if (category.value.id.isEmpty) return;
      List<TopicModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 100,
        "populate": "words",
        "queryField": {"category": category.value.id},
      });
      print(" hieu ${query}");
      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.wordTopics}", query);
      final data = response['data']['data'] as List<dynamic>;
      list.assignAll(data.map((item) => TopicModel.fromJson(item)).toList());
      topics.value = list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
