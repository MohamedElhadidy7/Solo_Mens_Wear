import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Router.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Features/Favourite/Presentation/View/Widgets/Favourite_View_Body.dart';

class Favouriteview extends StatelessWidget {
  const Favouriteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FavouriteViewBody(),
    );
  }
}
