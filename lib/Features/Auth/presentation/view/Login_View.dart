import 'package:flutter/material.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Login_View_Body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}