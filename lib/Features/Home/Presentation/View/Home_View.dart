import 'package:flutter/material.dart';
import 'package:solo/Features/Favourite/Presentation/View/FavouriteView.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Custom_NavigationBar.dart';
import 'package:solo/Features/Home/Presentation/View/Widgets/Home_View_Body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeViewBody(),
    Favouriteview(),
    Center(child: Text('Cart', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomNavigationbar(
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
