import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/welcomeControl/controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _text(String title, double size) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: size,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primarycolor1,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _text(controller.title, 25),
                  _text("Money is ultimate", 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
