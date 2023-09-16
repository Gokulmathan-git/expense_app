import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/signInControl/controller.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.controller,
  });

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !controller.state.isOtp.value
          ? phEnterWidget(context)
          : otpPinWidget(),
    );
  }

  Container phEnterWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        onChanged: (value) {
          controller.textLength(value.length);
          if (value.length > 9) {
            Get.focusScope?.unfocus();
          }
        },
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.dark,
        cursorColor: Colors.black,
        controller: controller.phoneController,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                controller.selectCountry(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${controller.selectedCountryValue.flagEmoji} + ${controller.selectedCountryValue.phoneCode}",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          suffixIcon: controller.state.textCount > 9
              ? Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : null,
          fillColor: Colors.white,
          filled: true,
          hintText: "Mobile number",
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.grey.withOpacity(0.5),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(color: Colors.white, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Pinput otpPinWidget() {
    return Pinput(
      controller: controller.otpController,
      length: 6,
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      onCompleted: (value) {
        controller.state.otpNum.value = value;
      },
    );
  }
}
