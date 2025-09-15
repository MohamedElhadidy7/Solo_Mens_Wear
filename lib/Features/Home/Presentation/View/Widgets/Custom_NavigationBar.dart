// CustomNavigationbar.dart - تمرير callback للتحديث
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../../Constants.dart';

class CustomNavigationbar extends StatelessWidget {
  const CustomNavigationbar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  final int selectedIndex;
  final Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
            backgroundColor: Colors.white,
            color: Colors.grey[400],
            activeColor: primarycolor,
            tabBackgroundColor: Colors.transparent,
            gap: 5,
            iconSize: 24,
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primarycolor,
            ),
            tabMargin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}