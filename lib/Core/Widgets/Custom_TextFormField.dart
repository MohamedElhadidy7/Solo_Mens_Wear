import 'package:flutter/material.dart';
import 'package:solo/Constants.dart';

class CustomTextformfield extends StatelessWidget {
  const CustomTextformfield({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
  });
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: primarycolor,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primarycolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primarycolor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primarycolor),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
