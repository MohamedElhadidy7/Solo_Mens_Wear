import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Features/Splash/Presentation/View/Splash_View.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
    ],
  );
}
