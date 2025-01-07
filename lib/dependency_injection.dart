import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:buniashop/features/user/dependency_injection.dart' as user_di;

final sl = GetIt.instance;

class Store {
  Store();

  void addIdUtilisateur(int idUtilisateur) {
    localStorage.setItem('id_utilisateur', idUtilisateur.toString());
  }

  int getIdUtilisateur() {
    return int.parse(localStorage.getItem('id_utilisateur') ?? '0');
  }
}

void init() {
  user_di.init(sl);
  sl.registerCachedFactory<Store>(() => Store());
  sl.registerFactory<SupabaseClient>(() => Supabase.instance.client);
}
