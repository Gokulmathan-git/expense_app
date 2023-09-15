import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class SignInController extends GetxController {
  final state = SignInState();

  final phoneController = TextEditingController().obs;
  Country get selectedCountryValue => state.selectedCountry.value;

  textLength(int count) {
    state.textCount.value = count;
  }

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
}
