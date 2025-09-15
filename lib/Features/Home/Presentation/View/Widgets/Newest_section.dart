import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/Assets_Data.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import '../../../../../Constants.dart';

class NewestSection extends StatefulWidget {
  const NewestSection({super.key});

  @override
  State<NewestSection> createState() => _NewestSectionState();
}

class _NewestSectionState extends State<NewestSection> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(6.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[50],
                      child: Image.asset(
                        AssetsData.outfit,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 20,
                        color: isFavorite ? Colors.red : Colors.grey[400],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -2.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Men's Casual Navy Shirt",
                    style: AppStyles.textstyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 5.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EGP 820',
                        style: AppStyles.textstyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14.sp),
                          SizedBox(width: 1.w),
                          Text(
                            '4K',
                            style: AppStyles.textstyle12.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
