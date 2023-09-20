import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../modals/user_items.dart';
import '../routes/route_name.dart';
import '../storage/common_data.dart';
import '../storage/store_data.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = "";
  final _profile = UserItem().obs;

  bool get islogin => _isLogin.value;
  UserItem get profile => _profile.value;

  @override
  void onInit() {
    token = StorageService.to.getString(storageUserTokenkey);
    var profileOffline = StorageService.to.getString(storageUserProfilekey);

    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(
        UserItem.fromJson(
          jsonDecode(profileOffline),
        ),
      );
    }
    super.onInit();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(storageUserTokenkey, value);
    token = value;
  }

  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    StorageService.to.setString(storageUserProfilekey, jsonEncode(profile));
    _profile(profile);
    setToken(profile.token!);
  }

  Future<void> logout() async {
    await StorageService.to.remove(storageUserTokenkey);
    await StorageService.to.remove(storageUserProfilekey);
    _isLogin.value = false;
    token = "";
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRouteName.signInPage);
  }
}
