import 'package:flutter/material.dart';
import 'package:solo/Features/Splash/Presentation/View/Widgets/Splash_View_Body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SplashViewBody());
  }
}
