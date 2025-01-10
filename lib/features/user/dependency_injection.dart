import 'package:buniashop/features/user/data/datasources/supabase_user_datasource.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/repository/user_data_repository.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:get_it/get_it.dart';

void init(GetIt sl) {
  sl.registerFactory<AuthentificateUserBloc>(
      () => AuthentificateUserBloc(authentificateUser: sl()));
  sl.registerFactory<RegisterUserBloc>(
      () => RegisterUserBloc(registerUser: sl()));

  sl.registerFactory<AuthentificateUser>(
      () => AuthentificateUser(repository: sl()));
  sl.registerFactory<RegisterUser>(() => RegisterUser(repository: sl()));

  sl.registerFactory<UserRepository>(
      () => UserDataRepository(datasource: sl()));

  sl.registerFactory<UserDatasource>(
      () => SupabaseUserDatasource(supabaseClient: sl()));
}
