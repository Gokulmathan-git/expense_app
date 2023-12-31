import 'package:expense_app/controller/signInControl/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/widget.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        body: Obx(
          () => SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Hello Chief"),
                    NumberField(controller: controller),
                    VerifyBtn(controller: controller),
                    if (controller.state.isOtp.value)
                      ResendBtn(controller: controller),
                  ],
                ),
                if (controller.state.isLoading.value)
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Loading.....",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Back"),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
