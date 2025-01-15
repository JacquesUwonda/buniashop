import 'package:buniashop/core/routes/routes_paths.dart';
import 'package:buniashop/core/services/bloc_provider.dart';
import 'package:buniashop/features/user/presentation/authentification/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:buniashop/dependency_injection.dart' as di;

import 'features/user/presentation/authentification/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  Supabase.initialize(
      url: "https://lpoeyhudliavfeewxion.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxwb2V5aHVkbGlhdmZlZXd4aW9uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1MjQ4NTMsImV4cCI6MjA1MjEwMDg1M30.iGoa0DMMEIkynMELNxqS9L6ZdUvNGEq1Hky6dbSmubU");
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders(context: context),
      child: MaterialApp.router(
        title: "buniaShop",
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
