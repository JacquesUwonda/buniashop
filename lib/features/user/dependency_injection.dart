import 'package:buniashop/features/user/data/datasources/supabase_user_datasource.dart';
import 'package:buniashop/features/user/data/datasources/utilisateur_datasource.dart';
import 'package:buniashop/features/user/data/repository/data_user_repository.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:get_it/get_it.dart';

void init(GetIt sl) {
  sl.registerFactory<UtilisateurAuthentifierBloc>(
      () => UtilisateurAuthentifierBloc(authentifierUtilisateur: sl()));
  sl.registerFactory<UtilisateurEnregistrerBloc>(
      () => UtilisateurEnregistrerBloc(enregistrerUtilisateur: sl()));

  sl.registerFactory<AuthentificateUser>(
      () => AuthentificateUser(repository: sl()));
  sl.registerFactory<RegisterUser>(() => RegisterUser(repository: sl()));

  sl.registerFactory<UserRepository>(
      () => DataUserRepository(datasource: sl()));

  sl.registerFactory<UserDatasource>(
      () => SupabaseUserDatasource(supabaseClient: sl()));
}
