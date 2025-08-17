import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:solo/Constants.dart';

class CustomOtp extends StatelessWidget {
  final TextEditingController otpController;
  final ValueChanged<String>? onCompleted;

  const CustomOtp({super.key, required this.otpController, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      controller: otpController,
      appContext: context,
      length: 4, // عدد خانات OTP
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
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (value) {},
      onCompleted: (value) {
        FocusScope.of(context).unfocus();
        if (onCompleted != null) {
          onCompleted!(value);
        }
      },
    );
  }
}
