import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'global/global_value.dart';
import 'routes/route_name.dart';
import 'routes/route_page.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xffd6d4ce),
      ),
    );
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            background: Color(0xffd6d4ce),
            error: Colors.red,
            onError: Colors.white,
            onBackground: Colors.black,
            surface: Color(0xffFFFBFE),
            onSurface: Color(0xff1C1B1F),
            primary: Color(0xffe63c3a),
            onPrimary: Colors.white,
            secondary: Color(0xff91908d),
            onSecondary: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: AppRouteName.initialPage,
      getPages: AppRoutePage().getPage,
      // home: const SignInPage(),
    );
  }
}
