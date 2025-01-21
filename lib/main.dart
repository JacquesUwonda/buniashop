import 'package:buniashop/core/routes/routes_names.dart';
import 'package:buniashop/core/services/bloc_provider.dart';
import 'package:buniashop/core/services/localUserData/local_storage.dart';
import 'package:buniashop/features/shop/presentation/pages/home_page.dart';
import 'package:buniashop/features/user/presentation/authentification/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buniashop/dependency_injection.dart' as di;

import 'features/user/presentation/authentification/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();
  final localStorage = di.sl<LocalStorageService>();
  final authToken = await localStorage.getString('authToken');
  final initialRoute =
      authToken != null ? RouteNames.homePage : RouteNames.login;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders(context: context),
      child: MaterialApp(
        title: 'BuniaShop',
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          RouteNames.login: (context) => LoginPage(),
          RouteNames.register: (context) => RegisterPage(),
          RouteNames.homePage: (context) => HomePage(),
        },
      ),
    );
  }
}
