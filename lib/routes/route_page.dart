import 'package:get/get.dart';

import '../controller/homeControl/binding.dart';
import '../controller/signInControl/binding.dart';
import '../controller/splashControl/binding.dart';

import '../pages/homePage/home_page.dart';
import '../pages/signInPage/sign_in_page.dart';
import '../pages/splashPage/splash_screen.dart';
import 'route_auth.dart';
import 'route_name.dart';

class AppRoutePage {
  List<GetPage> getPage = [
    GetPage(
      name: AppRouteName.initialPage,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouteName.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
      middlewares: [
        RouteAuthMiddleWare(priority: 1),
      ],
    ),
    GetPage(
      name: AppRouteName.signInPage,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
  ];
}
