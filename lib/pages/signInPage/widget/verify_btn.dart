import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/signInControl/controller.dart';

class VerifyBtn extends StatelessWidget {
  const VerifyBtn({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          if (!controller.state.isOtp.value) {
            controller.userLogin();
          } else {
            controller.otplogin();
          }

          Get.focusScope?.unfocus();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.withOpacity(0.7),
          shadowColor: Colors.red,
          elevation: 6,
          textStyle: const TextStyle(fontSize: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        child: Text(
          controller.state.isOtp.value ? "Sign In" : 'GET OTP',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
