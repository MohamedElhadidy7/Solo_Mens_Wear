import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Home/Data/Models/Category_Model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 16.w),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: secondrycolor,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Image.asset(
                    categoryList[i].image,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 5.h),
                Text(categoryList[i].title, style: AppStyles.textstyle12),
              ],
            );
          },
        ),
      ),
    );
  }
}
