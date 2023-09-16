import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class SignInState {
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
  ).obs; // country code

  RxInt textCount = 0.obs; // length of the text
  RxBool isOtp = false.obs;
  RxString otpNum = "".obs;
  RxBool isLoading = false.obs;
}
