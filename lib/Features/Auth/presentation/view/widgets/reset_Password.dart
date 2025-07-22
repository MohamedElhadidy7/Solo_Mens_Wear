import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obscureeText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Reset Password', style: AppStyles.textstyle28),
            ),
            SizedBox(height: 8.h),
            Text(
              'Set the new password for your account so you can log in and access all the features.',
              style: AppStyles.textstyle14.copyWith(color: Color(0xff7A7A7B)),
            ),
            SizedBox(height: 16.h),
            CustomTextformfield(
              hint: ' New Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureeText = !obscureeText;
                  });
                },
                icon: Icon(
                  obscureeText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              obscureText: obscureeText,
            ),
            SizedBox(height: 16.h),
            CustomTextformfield(
              hint: ' Re-enter Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureeText = !obscureeText;
                  });
                },
                icon: Icon(
                  obscureeText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              obscureText: obscureeText,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              textbutton: 'Update Password',
              onPressed: () {
                print('service handles');
              },
            ),
          ],
        ),
      ),
    );
  }
}
