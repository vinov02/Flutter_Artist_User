
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInputWidget extends StatefulWidget {
  const PhoneNumberInputWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberInputWidgetState createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // Handle phone number changes
        // print(number.phoneNumber); // Actual phone number
        // print(number.dialCode); // Selected dial code
      },
      onInputValidated: (bool value) {
        // Handle phone number validation
        // print(value);
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.blue),
      initialValue: PhoneNumber(isoCode: 'IN'),
      textFieldController: TextEditingController(),
      inputBorder: const OutlineInputBorder(),
      hintText: 'Enter your phone number',

    );
  }
}