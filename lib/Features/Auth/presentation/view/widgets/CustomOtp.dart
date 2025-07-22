import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:solo/Constants.dart';

class Customotp extends StatelessWidget {
  const Customotp({super.key, this.otpcontroller});
  final TextEditingController? otpcontroller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      controller: otpcontroller,
      appContext: context,
      length: 4, // Number of OTP digits
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 60,
        activeColor: primarycolor,
        inactiveColor: Colors.grey,
        selectedColor: primarycolor,
      ),
      cursorColor: primarycolor,
      animationDuration: Duration(milliseconds: 300),
      onChanged: (value) => print("Current OTP: $value"),
      onCompleted: (value) {
        print("OTP Entered: $value");
        FocusScope.of(context).unfocus();
      },
    );
  }
}
