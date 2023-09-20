import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/signInControl/controller.dart';
import '../firebase_options.dart';
import '../storage/store_data.dart';
import '../userStore/user_store.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Get.putAsync<StorageService>(
      () => StorageService().init(),
    );
    Get.put<UserStore>(
      UserStore(),
    );
  }
}
