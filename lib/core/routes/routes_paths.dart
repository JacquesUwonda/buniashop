import 'package:buniashop/features/shop/presentation/pages/home_page.dart';
import 'package:buniashop/features/user/presentation/authentification/pages/login.dart';
import 'package:buniashop/features/user/presentation/authentification/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:buniashop/core/routes/routes_names.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: RouteNames.login,
      path: "/",
      builder: (context, state) =>
          Supabase.instance.client.auth.currentUser == null
              ? LoginPage()
              : HomePage(),
    ),
    GoRoute(
      name: RouteNames.register,
      path: "/register",
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      name: RouteNames.homePage,
      path: "/homepage",
      builder: (context, state) => HomePage(),
    ),
  ],
);
