import 'dart:convert';

import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/core/utils/progress_dialog_utils.dart';
import 'package:toeic_test/data/models/login/post_login_resp.dart';
import 'package:toeic_test/data/models/me/get_me_resp.dart';
import 'package:http/http.dart' as http;
import 'package:toeic_test/data/models/user/User.dart';

class ApiClient extends GetConnect {
  var url = ApiConstant.baseApiUrl;
  UserSchema currentUser = UserSchema();
  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 60);
  }

  void setCurrentUser(UserSchema user) {
    currentUser = user;
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Map<String, String> getHeader() {
    String token = Get.find<PrefUtils>().getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<GetMeResp> fetchMe({Map<String, String> headers = const {}}) async {
    return GetMeResp();
    // ProgressDialogUtils.showProgressDialog();
    // try {
    //   await isNetworkConnected();
    //   Response response =
    //       await httpClient.get('$url/device/api/v1/user/me', headers: headers);
    //   ProgressDialogUtils.hideProgressDialog();
    //   if (_isSuccessCall(response)) {
    //     return GetMeResp.fromJson(response.body);
    //   } else {
    //     throw response.body != null
    //         ? GetMeResp.fromJson(response.body)
    //         : 'Something Went Wrong!';
    //   }
    // } catch (error, stackTrace) {
    //   ProgressDialogUtils.hideProgressDialog();
    //   Logger.log(error, stackTrace: stackTrace);
    //   rethrow;
    // }
  }

  Future<Map<String, dynamic>> requestPost(
      String apiUrl, Map<String, dynamic> requestBody) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      http.Response response = await http.post(Uri.parse('$url$apiUrl'),
          headers: getHeader(), body: json.encode(requestBody));
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> requestGet(String apiUrl) async {
    // ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      http.Response response =
          await http.get(Uri.parse('$url$apiUrl'), headers: getHeader());
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      // ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getTokenFromServer(
      String firebaseAccessToken) async {
    try {
      await isNetworkConnected();
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $firebaseAccessToken',
      };

      http.Response response = await http
          .post(Uri.parse('$url/device/auth/firebase-login'), headers: headers);
      if (_isSuccessCall(response)) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Map<String, dynamic> buildQuery(Map<String, dynamic> options) {
    options = removeUndefined(options);
    Map<String, dynamic> query = {
      'query': {},
      'options': {
        'lean': false,
        'leanWithId': true,
        'offset': 0,
        'page': options['page'] ?? 1,
        'limit': options['rowsPerPage'] ?? 10,
        'pagination': true,
        'useEstimatedCount': false,
        'useCustomCountFn': false,
        'forceCountFn': false,
      },
      'isCountOnly': false,
    };
    if (options['searchField'] != null &&
        options['searchField'] is List &&
        options['search'] != null) {
      query['query'] = {
        '\$or': (options['searchField'] ?? []).map((e) => {
              "field": {
                '\$regex': '${options['search'] ?? ""}',
                '\$options': 'i'
              }
            })
      };
    }
    // if (options['ids'] != null && options['ids'] is List) {
    //   query['query'] = {...query, '_id': {'\$in': options['ids']}};
    // }
    if (options?['populate'] != null) {
      query['options']['populate'] = options?['populate'];
    }
    if (options?['queryField'] != null) {
      Map<String, dynamic> tmp = Map.fromEntries(options['queryField']
          ?.entries
          ?.where((element) => element.value != null));
      query['query'].addAll(tmp);
    }

    return query;
  }

  Map<String, dynamic> removeUndefined(Map<String, dynamic>? options) {
    options?.removeWhere((key, value) => value == null);
    return options ?? {};
  }
}
