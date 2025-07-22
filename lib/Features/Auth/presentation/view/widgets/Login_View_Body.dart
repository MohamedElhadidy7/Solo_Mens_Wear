import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Loginsection.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/SocialMediaSectiom.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 160.h),
            Center(child: Text('Welcome Back!', style: AppStyles.textstyle28)),
            const SizedBox(height: 30),
            Socialmediasection(),
            const SizedBox(height: 20),
            Loginsection(),
          ],
        ),
      ),
    );
  }
}
