import 'package:buniashop/core/services/localUserData/local_storage.dart';
import 'package:buniashop/core/services/localUserData/shared_preferencies.dart';
import 'package:buniashop/features/user/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await Supabase.initialize(
      url: "https://lpoeyhudliavfeewxion.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxwb2V5aHVkbGlhdmZlZXd4aW9uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1MjQ4NTMsImV4cCI6MjA1MjEwMDg1M30.iGoa0DMMEIkynMELNxqS9L6ZdUvNGEq1Hky6dbSmubU");
  // Global Dependencies
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<LocalStorageService>(
      () => SharedPreferencesStorage());

  // User Module Dependencies
  initUserDependencies(sl);
}
