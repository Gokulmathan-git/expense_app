import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/signInControl/controller.dart';

class ResendBtn extends StatelessWidget {
  const ResendBtn({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            controller.userLogin();
            Get.focusScope?.unfocus();
          },
          child: Text(
            'Resend new code',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.otpController.clear();
            controller.phoneController.clear();
            controller.state.isOtp.value = false;
            controller.state.textCount.value = 0;
            Get.focusScope?.unfocus();
          },
          child: Text(
            '< back',
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
