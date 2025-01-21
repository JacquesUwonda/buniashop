import 'package:buniashop/features/user/data/repository/user_data_repository.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/datasources/supabase_user_datasource.dart';

void initUserDependencies(GetIt sl) {
  // Datasource
  sl.registerLazySingleton<UserDatasource>(
    () => SupabaseUserDatasource(sl()),
  );

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserDataRepository(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => AuthentificateUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));

  // Blocs
  sl.registerFactory(() => AuthentificateUserBloc(
        loginUser: sl(),
        localStorage: sl(),
      ));
  sl.registerFactory(() => RegisterUserBloc(registerUser: sl()));
  sl.registerFactory(
      () => LogoutUserBloc(logoutUser: sl(), localStorage: sl()));
}
