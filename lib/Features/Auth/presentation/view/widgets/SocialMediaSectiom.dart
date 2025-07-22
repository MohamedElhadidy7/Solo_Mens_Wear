import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/Assets_Data.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/SocialMediaBotton.dart';

class Socialmediasection extends StatelessWidget {
  const Socialmediasection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Socialmediabotton(
          onPressed: () {},
          imagedata: AssetsData.google,
          data: 'Google',
        ),
        SizedBox(width: 12.w),
        Socialmediabotton(
          onPressed: () {},
          imagedata: AssetsData.facebook,
          data: 'Facebook',
        ),
      ],
    );
  }
}
