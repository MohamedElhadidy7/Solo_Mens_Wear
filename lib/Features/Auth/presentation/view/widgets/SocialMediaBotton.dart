import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';

class Socialmediabotton extends StatelessWidget {
  const Socialmediabotton({
    super.key,
    required this.onPressed,
    required this.imagedata,
    required this.data,
  });
  final void Function()? onPressed;
  final String imagedata;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: MaterialButton(
        minWidth: 150.w,
        height: 45.h,

        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imagedata),
            SizedBox(width: 4.w),
            Text(
              data,
              style: AppStyles.textstyle16.copyWith(
                color: Color(0xff677294),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
