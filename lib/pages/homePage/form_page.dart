import 'package:expense_app/storage/secure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Your Details :"),
            const SizedBox(
              height: 10,
            ),
            formField(
              hintText: "Please Enter Your Name",
              controller: nameController,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  "Please add your monthly income and also if any additional income too :"),
            ),
            const SizedBox(
              height: 5,
            ),
            formField(
              hintText: "Enter Your amount",
              controller: amountController,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                var enId = EncryptData.encrypt("users");
                print("enid $enId");
                Get.focusScope?.unfocus();
              },
              child: const Text("Go >>>"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.focusScope?.unfocus();
              },
              child: const Text("Go >>>"),
            ),
          ],
        ),
      ),
    );
  }

  Padding formField(
      {String? hintText, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText ?? "Complete this Field",
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.black.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
