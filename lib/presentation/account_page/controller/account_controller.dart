import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/data/apiClient/api_client.dart';
import 'package:toeic_test/data/models/exam/result.dart';
import 'package:toeic_test/data/models/user/User.dart';
import 'package:toeic_test/presentation/account_page/models/account_model.dart';

class AccountController extends GetxController {
  AccountController();
  Rx<UserSchema> user = Rx<UserSchema>(UserSchema(scoreStatistics: []));
  Rx<ToeicScore> toeicScore = Rx<ToeicScore>(ToeicScore());
  RxBool isUpdated = RxBool(false);
  RxList<Result> results = RxList<Result>([]);
  Future<void> getData() async {
    await updateScoreStatics();
    await callFetchResult();
  }

  Future<void> updateScoreStatics() async {
    try {
      UserSchema currentUser = await Get.find<ApiClient>().fetchMe();
      toeicScore.value = currentUser.getScoreStatics();
    } catch (e) {
      print("hieu error  ${e}");
      rethrow;
    }
  }

  Future<void> callFetchResult() async {
    try {
      List<Result> list = [];
      Map<String, dynamic> query = Get.find<ApiClient>().buildQuery({
        "page": 0,
        "rowsPerPage": 100,
        "queryField": {
          "addedBy": Get.find<ApiClient>().currentUser.id,
          "sort": {"updatedAt": -1}
        },
        "populate": "exam"
      });

      final response = await Get.find<ApiClient>()
          .requestPost("${ApiConstant.result}/list", query);
      if (response['data'] != null) {
        final data = (response['data']['data'] ?? []) as List<dynamic>;
        list.assignAll(data.map((item) => Result.fromJson(item)).toList());
      }
      list.sort((a, b) {
        if (a.updatedAt == null && b.updatedAt == null) {
          return 0;
        } else if (a.updatedAt == null) {
          return -1;
        } else if (b.updatedAt == null) {
          return 1;
        } else {
          return b.updatedAt!.compareTo(a.updatedAt!);
        }
      });
      results.value = list;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    updateScoreStatics();
  }

  @override
  void onClose() {
    print("hieu AccountController close");
    super.onClose();
  }
}
