import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/presentation/dashboard_page/models/category_item_model.dart';
import 'package:toeic_test/presentation/lession_topic_screen/models/lession_model.dart';

class LessionTopicController extends GetxController {
  RxList<CategoryItemModel> categories = RxList([]);
  Rx<CategoryType> categoryType = Rx<CategoryType>(CategoryType.non);
  Rx<CategoryItemModel> category = CategoryItemModel().obs;
  RxList<LessionModel> lessions = RxList<LessionModel>([]);
  @override
  void onReady() {
    super.onReady();
    final args = Get.arguments as Map<String, dynamic>;
    category.value = args["category"] as CategoryItemModel;
    print(" hieu category${category.value.id}");
    callFetchTopic();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> callFetchTopic() async {
    try {
      if (category.value.id.isEmpty) return;
      List<LessionModel> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 100,
        // "populate": "words",
        "queryField": {"category": category.value.id},
      });
      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.lessions}", query);
      final data = response['data']['data'] as List<dynamic>;
      list.assignAll(data.map((item) => LessionModel.fromJson(item)).toList());
      lessions.value = list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
