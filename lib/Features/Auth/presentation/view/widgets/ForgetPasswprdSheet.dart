import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'OtpSheet.dart';

class ForgetPasswordSheet extends StatelessWidget {
  const ForgetPasswordSheet({super.key});

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
              child: Text('Forget Password', style: AppStyles.textstyle28),
            ),
            Text(
              'Enter your email for the verification process, we will send 4 digits code to your email',
              style: AppStyles.textstyle14.copyWith(color: Color(0xff7A7A7B)),
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              child: CustomTextformfield(hint: 'Enter your Email'),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              textbutton: 'Continue',
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => const OtpSheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
