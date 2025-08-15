import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Utils/Assets_Data.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _text1Controller;
  late AnimationController _text2Controller;

  @override
  void initState() {
    super.initState();

    // شعار الانميشن
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    _text1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _text2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // التوقيت
    Future.delayed(const Duration(milliseconds: 300), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      _text1Controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      _text2Controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 7000), () async {
      await WidgetsBinding.instance.endOfFrame;
      if (mounted) {
        GoRouter.of(context).push('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _text1Controller.dispose();
    _text2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _logoController,
            child: SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(0, -1.5),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _logoController,
                      curve: Curves.easeOut,
                    ),
                  ),
              child: SizedBox(
                height: 200,
                width: 250.w,
                child: Image.asset(AssetsData.logo, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _text1Controller,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _text1Controller,
                          curve: Curves.easeOut,
                        ),
                      ),
                  child: Text('Go Solo,', style: AppStyles.textstyle30),
                ),
              ),
              const SizedBox(width: 5),
              FadeTransition(
                opacity: _text2Controller,
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _text2Controller,
                          curve: Curves.easeOut,
                        ),
                      ),
                  child: Text('Go Far...', style: AppStyles.textstyle30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
