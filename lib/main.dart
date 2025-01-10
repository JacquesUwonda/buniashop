import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:buniashop/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  Supabase.initialize(
      url: "https://lpoeyhudliavfeewxion.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxwb2V5aHVkbGlhdmZlZXd4aW9uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1MjQ4NTMsImV4cCI6MjA1MjEwMDg1M30.iGoa0DMMEIkynMELNxqS9L6ZdUvNGEq1Hky6dbSmubU");
  di.init();

  runApp(MaterialApp(
    title: "buniaShop",
    routes: <String, WidgetBuilder>{
      "/": (BuildContext context) =>
          Supabase.instance.client.auth.currentUser == null
              ? Scaffold()
              : Scaffold(),
      "/enregistrer": (BuildContext context) =>
          Supabase.instance.client.auth.currentUser == null
              ? Scaffold()
              : Scaffold(),
    },
  ));
}
