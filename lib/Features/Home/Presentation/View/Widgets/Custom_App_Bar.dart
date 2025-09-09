import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SOLO', style: AppStyles.textstyle28),
            Text(
              'Shop by brands and fashion',
              style: AppStyles.textstyle12.copyWith(color: primarycolor),
            ),
          ],
        ),
        Spacer(),
        Container(
          width: 48.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: secondrycolor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ),
      ],
    );
  }
}
