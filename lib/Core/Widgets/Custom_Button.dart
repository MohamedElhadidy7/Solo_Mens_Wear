import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textbutton, this.onPressed});
  final String textbutton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: primarycolor,
      onPressed: onPressed,
      child: Text(
        textbutton,
        style: AppStyles.textstyle20.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
