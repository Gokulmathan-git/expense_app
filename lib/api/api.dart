import 'dart:convert';

import '../modals/login_data.dart';
import '../modals/user_items.dart';
import 'package:http/http.dart' as http;

import '../storage/common_data.dart';

class UserApi {
  static Future<ApiResponse> loginData({
    required LoginData responseBody,
    required String appendUrl,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + appendUrl),
      headers: headers,
      body: jsonEncode(responseBody.toJson()),
    );
    return ApiResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ApiResponse> updateLoginData({
    required UserData responseBody,
    required String appendUrl,
  }) async {
    var response = await http.post(
      Uri.parse(baseUrl + appendUrl),
      headers: headers,
      body: jsonEncode(responseBody.toJson()),
    );
    return ApiResponse.fromJson(jsonDecode(response.body));
  }
}
