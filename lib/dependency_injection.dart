import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:buniashop/features/user/dependency_injection.dart' as user_di;

final sl = GetIt.instance;

class Store {
  Store();

  void addUserId(int userId) {
    localStorage.setItem('user_id', userId.toString());
  }

  int getUserId() {
    return int.parse(localStorage.getItem('user_id') ?? '0');
  }
}

void init() {
  user_di.init(sl);
  sl.registerCachedFactory<Store>(() => Store());
  sl.registerFactory<SupabaseClient>(() => Supabase.instance.client);
}
