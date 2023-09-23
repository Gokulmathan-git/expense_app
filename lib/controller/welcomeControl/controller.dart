import 'package:get/get.dart';
import '../../routes/route_name.dart';
import 'state.dart';

class WelcomeController extends GetxController {
  final title = "Expense";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRouteName.homePage),
    );
    print("welcome page");
  }
}
