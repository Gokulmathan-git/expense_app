import 'package:get/get.dart';

import '../controller/homeControl/binding.dart';
import '../controller/signInControl/binding.dart';
import '../controller/welcomeControl/binding.dart';

import '../pages/homePage/home_page.dart';
import '../pages/signInPage/sign_in_page.dart';
import '../pages/welcomePage/welcome_page.dart';
import 'route_auth.dart';
import 'route_name.dart';

class AppRoutePage {
  List<GetPage> getPage = [
    GetPage(
      name: AppRouteName.initialPage,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRouteName.homePage,
      page: () => HomePage(),
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
