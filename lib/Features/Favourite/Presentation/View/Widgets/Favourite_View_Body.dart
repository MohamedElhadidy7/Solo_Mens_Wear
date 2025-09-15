import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Search_Field.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Newest_section.dart';

// الطريقة الأولى: باستخدام Column مع Expanded (الأفضل)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Search_Field.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Newest_section.dart';


// الطريقة الثانية: باستخدام CustomScrollView (أكثر مرونة)
class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){GoRouter.of(context).push('/Home');}, icon: Icon(Icons.arrow_back_ios)),
                      Expanded(child: Center(child: Text('Favourite',style: AppStyles.textstyle28.copyWith(color: primarycolor),))),
                      SizedBox(width: 48.w),
                    ],
                  ),
      
                  SizedBox(height: 16.h,),
                  CustomSearchField(
                    hint: 'Search ',
                    prefixIcon: Icon(Icons.search),
                  ),
                  SizedBox(height: 18.h),
                  Text('Favorite items (4)', style: AppStyles.textstyle20),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
      
      
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.60,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return NewestSection();
                },
                childCount: 4,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
      
      
        ],
      ),
    );
  }
}