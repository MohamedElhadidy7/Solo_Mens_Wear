import 'package:flutter/material.dart';
import 'package:solo/Constants.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.hint,
    this.controller,

    this.validator,
    this.onChanged,
    this.prefixIcon,
  });
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      cursorColor: primarycolor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Color(0xff969696)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff969696)),
          borderRadius: BorderRadius.circular(22),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff969696)),
          borderRadius: BorderRadius.circular(22),
        ),
        hintText: hint,
      ),
    );
  }
}
