import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      GoRouter.of(context).push('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = "Solo".split('');

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: word.asMap().entries.map((entry) {
              int index = entry.key;
              String char = entry.value;

              Color charColor = index % 2 == 0 ? Colors.orange : Colors.black;

              return Animate(
                effects: [
                  MoveEffect(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                    duration: 400.ms,
                    delay: (index * 200).ms,
                  ),
                  FadeEffect(duration: 300.ms),
                ],
                child: Text(
                  char,
                  style: TextStyle(
                    fontSize: 70.sp,
                    fontWeight: FontWeight.bold,
                  ).copyWith(color: charColor),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
