import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class SignInState {
  RxBool isSkipped = false.obs;
  var selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  ).obs;

  RxInt textCount = 0.obs; // length of the text
  RxBool isOtp = false.obs;
  RxString otpNum = "".obs;
}
