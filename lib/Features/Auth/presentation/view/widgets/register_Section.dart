import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformfield(hint: 'Name'),
        const SizedBox(height: 20),
        CustomTextformfield(hint: 'Phone', keyboardType: TextInputType.number),
        const SizedBox(height: 20),
        CustomTextformfield(hint: 'Email'),
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

        const SizedBox(height: 14),
        CustomButton(
          textbutton: 'Sign Up',
          onPressed: () {
            print('Sign Up');
          },
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Have an account?", style: AppStyles.textstyle14),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                'Log In',
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
    ;
  }
}
