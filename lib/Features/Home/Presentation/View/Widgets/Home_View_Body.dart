import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Home/Data/Models/Category_Model.dart';

import 'package:solo/Features/Home/Presentation/View/Widgets/Category_List.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Custom_App_Bar.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Custom_Search_Field.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/carousel_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CustomAppBar(),
                SizedBox(height: 16.h),
                CustomSearchField(
                  hint: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          CustomCarouselSlider(),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Category', style: AppStyles.textstyle20),
            ),
          ),
          SizedBox(height: 16.h),
          CategoryList(),
        ],
      ),
    );
  }
}
