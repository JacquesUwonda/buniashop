import 'package:buniashop/features/user/presentation/authentification/pages/login.dart';
import 'package:buniashop/features/user/presentation/authentification/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:buniashop/core/routes/routes_names.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.login,
      path: "/login",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: RouteNames.register,
      path: "/register",
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      name: RouteNames.homePage,
      path: "/homepage",
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
