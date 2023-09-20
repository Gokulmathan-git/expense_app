import 'dart:convert';

import '../modals/login_data.dart';
import '../modals/user_items.dart';
import 'package:http/http.dart' as http;

import '../storage/common_data.dart';

class UserApi {
  static Future<UserLoginResponse> login({
    LoginData? responseBody,
  }) async {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(responseBody?.toJson()),
    );
    return UserLoginResponse.fromJson(jsonDecode(response.body));
  }
}
