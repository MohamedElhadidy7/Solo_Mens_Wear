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
  late AnimationController _logoMoveController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _logoMoveAnimation;

  @override
  void initState() {
    super.initState();

    // Animation للوجو يطلع من جوا الشاشة (أطول وأنعم)
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Animation للوجو يتحرك بعد فترة (أنعم)
    _logoMoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // تأثير Scale للوجو مع curve أنعم
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOutBack, // curve أنعم من elasticOut
      ),
    );

    // تأثير opacity منفصل للتحكم الأفضل
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    // تأثير الحركة أنعم وأقل حدة
    _logoMoveAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.5), // حركة أقل
    ).animate(
      CurvedAnimation(
        parent: _logoMoveController,
        curve: Curves.easeInOutCubic, // curve أنعم
      ),
    );

    // تشغيل animation الوجو مع تأخير أقل
    Future.delayed(const Duration(milliseconds: 200), () {
      _logoController.forward();
    });

    // تشغيل animation الحركة بعد وقت أطول للاستمتاع بالوجو
    Future.delayed(const Duration(milliseconds: 6000), () {
      _logoMoveController.forward();
    });

    // الانتقال للصفحة التالية
    Future.delayed(const Duration(milliseconds: 7500), () async {
      await WidgetsBinding.instance.endOfFrame;
      if (mounted) {
        GoRouter.of(context).push('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _logoMoveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_logoController, _logoMoveController]),
        builder: (context, child) {
          return SlideTransition(
            position: _logoMoveAnimation,
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: _logoMoveController,
                  curve: Curves.easeInCubic, // fade out أنعم
                ),
              ),
              child: FadeTransition(
                opacity: _logoOpacityAnimation, // fade in منفصل
                child: ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: Container(
                    height: 300.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                     
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AssetsData.logo1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}