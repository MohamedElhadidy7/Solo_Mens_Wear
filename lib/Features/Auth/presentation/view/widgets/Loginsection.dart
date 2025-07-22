import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/CustomOtp.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/ForgetPasswprdSheet.dart';

class Loginsection extends StatefulWidget {
  const Loginsection({super.key});

  @override
  State<Loginsection> createState() => _LoginsectionState();
}

class _LoginsectionState extends State<Loginsection> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformfield(
          hint: 'Example11@gmail.com',
          suffixIcon: Icon(Icons.email),
        ),
        const SizedBox(height: 20),
        CustomTextformfield(
          hint: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          obscureText: obscureText,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                context: context,
                builder: (context) => const ForgetPasswordSheet(),
              );
            },
            child: Text(
              'Forget Password?',
              style: AppStyles.textstyle14.copyWith(color: primarycolor),
            ),
          ),
        ),
        const SizedBox(height: 14),
        CustomButton(
          textbutton: 'Log in',
          onPressed: () {
            print('login');
          },
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?", style: AppStyles.textstyle14),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                GoRouter.of(context).push('/Register');
              },
              child: Text(
                'Join Us',
                style: AppStyles.textstyle14.copyWith(
                  color: primarycolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
