import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Features/Auth/presentation/view/Login_View.dart';
import 'package:solo/Features/Auth/presentation/view/regiester_View.dart';
import 'package:solo/Features/Favourite/Presentation/View/FavouriteView.dart';
import 'package:solo/Features/Home/Presentation/View/Home_View.dart';
import 'package:solo/Features/Splash/Presentation/View/Splash_View.dart';
import 'package:solo/Features/onboarding/presentation/view/onboarding_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: '/Register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegiesterView();
        },
      ),
      GoRoute(
        path: '/Home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/Favourite',
        builder: (BuildContext context, GoRouterState state) {
          return const Favouriteview();
        },
      ),
    ],
  );
}
