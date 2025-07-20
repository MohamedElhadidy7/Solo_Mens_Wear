import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solo/Features/onboarding/data/Models/onboardingModel.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int page = _controller.page?.round() ?? 0;
      if (currentPage != page) {
        setState(() {
          currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: onboardingPages.length,
      itemBuilder: (context, i) {
        final page = onboardingPages[i];
        return Stack(
          children: [
            Positioned.fill(child: Image.asset(page.image, fit: BoxFit.cover)),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.88),
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 200.h,
              left: 50.w,
              right: 50.w,

              child: Text(
                textAlign: TextAlign.center,
                page.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Positioned(
              bottom: 150.h,
              left: 50.w,
              right: 50.w,

              child: Text(
                maxLines: 2,
                page.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Positioned(
              bottom: 35.h,
              left: 16.w,
              child: SmoothPageIndicator(
                controller: _controller,
                count: onboardingPages.length,
                effect: WormEffect(
                  dotHeight: 6.h,
                  dotWidth: 12.w,
                  spacing: 4,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                ),
              ),
            ),
            if (currentPage != onboardingPages.length - 1)
              Positioned(
                top: 25.h,
                right: 16.w,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            currentPage == onboardingPages.length - 1
                ? Positioned(
                    bottom: 25.h,
                    right: 16.w,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Get Statrted',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 25.h,
                    right: 16.w,
                    child: MaterialButton(
                      minWidth: 40.w,
                      height: 50.h,
                      shape: CircleBorder(),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: 30.sp,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
