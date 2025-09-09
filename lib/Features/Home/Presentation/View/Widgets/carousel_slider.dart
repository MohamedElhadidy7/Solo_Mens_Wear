import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Constants.dart';
import 'dart:async';

import 'package:solo/Core/Utils/App_Styles.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final PageController pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 1,
  );
  Timer? timer;
  int currentPage = 1;

  final List<String> items = [
    'assets/images/newCollection.jpg',
    'assets/images/newCollection.jpg',
    'assets/images/newCollection.jpg',
  ];

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  void startAutoPlay() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < items.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoPlay() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              stopAutoPlay();
              Future.delayed(const Duration(seconds: 3), () {
                if (mounted) {
                  startAutoPlay();
                }
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      items[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 190.h,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image, size: 50, color: Colors.grey),
                                Text('صورة غير متاحة'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    Positioned(
                      left: 12.w,
                      top: 50.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Collection',
                            style: AppStyles.textstyle14.copyWith(
                              color: secondrycolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            'Discount 50% for\nnew summer\ncollection.',
                            style: AppStyles.textstyle12.copyWith(
                              color: secondrycolor,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 12.w,
                      bottom: 15.h,
                      child: SizedBox(
                        width: 100.w,
                        height: 35.h,
                        child: ElevatedButton(
                          onPressed: () {
                            print('Shop Now pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primarycolor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                          ),
                          child: Text(
                            'Shop Now',
                            style: AppStyles.textstyle12.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
