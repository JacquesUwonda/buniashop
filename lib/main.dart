import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:buniashop/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  Supabase.initialize(
      url: "https://gzcntgkfbhmzphhfzmka.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd6Y250Z2tmYmhtenBoaGZ6bWthIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUzOTc2MTgsImV4cCI6MjA1MDk3MzYxOH0.AB3gisCuv1Vg5GNi1OyDIub5CBoJOfrGevPbN-j0l-4");
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
