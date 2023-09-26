import 'package:expense_app/controller/splashControl/state.dart';
import 'package:get/get.dart';
import '../../routes/route_name.dart';

class SplashController extends GetxController {
  final state = SplashState();
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 500), () {
      state.animate.value = true;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () => Get.offAllNamed(AppRouteName.homePage),
    // );
    print("welcome page");
  }
}
