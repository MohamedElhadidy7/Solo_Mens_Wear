import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Constants.dart';

import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Home/Data/Models/Category_Model.dart';

import 'package:solo/Features/Home/Presentation/View/Widgets/Category_List.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Custom_App_Bar.dart';
import 'package:solo/Core/Widgets/Custom_Search_Field.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Newest_section.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/carousel_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
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
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Category', style: AppStyles.textstyle20),
                  ),
                ),
                SizedBox(height: 10.h),
                CategoryList(),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Newest items', style: AppStyles.textstyle20),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.60,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return NewestSection();
              }, childCount: 4),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }
}
