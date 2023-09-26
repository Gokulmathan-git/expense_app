import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splashControl/controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                top: controller.state.animate.value ? 0 : -30,
                left: controller.state.animate.value ? 0 : -30,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(40, 40),
                      bottomLeft: Radius.elliptical(40, 40),
                      bottomRight: Radius.elliptical(90, 90),
                    ),
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
              Center(
                child: Image.asset("asset/logo.png"),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                bottom: 60,
                right: controller.state.animate.value ? 20 : 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  height: 40,
                  width: 40,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1000),
                bottom: 40,
                right: controller.state.animate.value ? 10 : 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  height: 20,
                  width: 20,
                ),
              ),
              // Center(
              //   child: ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
