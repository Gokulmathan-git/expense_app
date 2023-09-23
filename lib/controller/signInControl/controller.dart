import 'package:country_picker/country_picker.dart';
import 'package:expense_app/userStore/controller/connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/api.dart';
import '../../modals/login_data.dart';

import '../../routes/route_name.dart';
import '../../userStore/user_store.dart';
import 'state.dart';

class SignInController extends GetxController {
  final state = SignInState();

  final _phoneController = TextEditingController().obs;
  final _otpController = TextEditingController().obs;

  TextEditingController get phoneController => _phoneController.value;
  TextEditingController get otpController => _otpController.value;
  Country get selectedCountryValue => state.selectedCountry.value;

  FirebaseAuth auth = FirebaseAuth.instance;
  final verificationIdValue = "".obs;

  final ConnectionManagerController _controller =
      Get.find<ConnectionManagerController>();

// text length finding
  textLength(int count) {
    state.textCount.value = count;
  }

// country select
  selectCountry(BuildContext context) {
    showCountryPicker(
        context: context,
        countryListTheme: const CountryListThemeData(
          bottomSheetHeight: 550,
        ),
        onSelect: (value) {
          state.selectedCountry.value = value;
        });
  }

  // login
  void userLogin() async {
    String mobile = _phoneController.value.text;
    if (mobile.isNotEmpty && mobile.length == 10) {
      if (_controller.connectionType.value == 0) {
        Get.snackbar("Connection Check:", "No Internet Connection");
      } else {
        _signInWithPhoneNumber(
            "+${state.selectedCountry.value.phoneCode}$mobile");
        state.isLoading.value = true;
      }
    } else {
      print("null value of mobile number");
      Fluttertoast.showToast(
          msg: "Please enter or check the mobile number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

// sign with phone auth in firebase
  Future<void> _signInWithPhoneNumber(String phoneNumber) async {
    print("phone number $phoneNumber");
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);

          print("credential successful $credential");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("verification failed $e");
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = '';
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          state.isLoading.value = false;
          state.isOtp.value = true;
          verificationIdValue.value = verificationId;
          await auth.signInWithCredential(credential);

          print("auth done");
          // authentication successful
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // code auto retrieval timed out
          print("verification auto retrieval $verificationId");
        },
      );
    } catch (e) {
      print("exception in sign in $e");
    }
  }

// verify OTP to login
  void otplogin() {
    if (state.otpNum.value.isNotEmpty) {
      _verifyOtp(state.otpNum.value);
      state.isLoading.value = true;
    } else {
      Get.snackbar(
        "Failed :",
        "Enter 6-Digit code",
        colorText: Colors.black,
      );
    }
  }

// OTP verification
  void _verifyOtp(
    String userOtp,
  ) async {
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationIdValue.value, smsCode: userOtp);
      var userValue = (await auth.signInWithCredential(creds)).user;

      LoginData userLoginData = LoginData();
      userLoginData.phoneNumber = userValue!.phoneNumber;
      userLoginData.id = userValue.uid;

      postAllData(userLoginData);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  postAllData(LoginData userLoginData) async {
    var result = await UserApi.loginData(
        responseBody: userLoginData, appendUrl: "/create");
    if (result.msg == "success") {
      await UserStore.to.saveProfile(result.data!);
    } else {
      Fluttertoast.showToast(
        msg: "Error in post data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    state.isLoading.value = false;
    Get.offAllNamed(AppRouteName.homePage);
  }

  @override
  void onClose() {
    _phoneController.value.dispose();
    _otpController.value.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    _phoneController.value.dispose();
    _otpController.value.dispose();
    super.dispose();
  }
}
