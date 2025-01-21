import 'package:bloc/bloc.dart';
import 'package:buniashop/core/services/localUserData/local_storage.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';

class AuthentificateUserBloc extends Bloc<UserEvent, UserState> {
  final AuthentificateUser loginUser;
  final LocalStorageService localStorage;

  AuthentificateUserBloc({
    required this.loginUser,
    required this.localStorage,
  }) : super(UserInitialState()) {
    on<AuthentificateUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await loginUser(event.email, event.password);
        emit(UserSuccess(result: user));
        // Sauvegarde du jeton dans le Local Storage
        await localStorage.saveString('authToken', user.token);
      } catch (e) {
        emit(UserEchecState(reason: "Server Error"));
      }
    });
  }
}

class RegisterUserBloc extends Bloc<RegisterUserEvent, UserState> {
  final RegisterUser registerUser;
  RegisterUserBloc({required this.registerUser}) : super(UserInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await registerUser(event.email, event.password);
        emit(UserSuccess(result: user));
      } catch (e) {
        emit(UserEchecState(reason: "Server Error"));
      }
    });
  }
}

class LogoutUserBloc extends Bloc<LogoutUserEvent, UserState> {
  final LogoutUser logoutUser;
  final LocalStorageService localStorage;
  LogoutUserBloc({
    required this.logoutUser,
    required this.localStorage,
  }) : super(UserInitialState()) {
    on<LogoutUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        await logoutUser();
        await localStorage.remove('authToken');
        emit(UserSuccess(result: "Déconnexion réussie"));
      } catch (e) {
        emit(UserEchecState(reason: "Server Error"));
      }
    });
  }
}
