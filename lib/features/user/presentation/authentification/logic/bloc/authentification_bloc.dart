import 'package:bloc/bloc.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';

class AuthentificateUserBloc extends Bloc<UserEvent, UserState> {
  final AuthentificateUser loginUser;

  AuthentificateUserBloc({
    required this.loginUser,
  }) : super(UserInitialState()) {
    on<AuthentificateUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await loginUser(event.email, event.password);
        emit(UserSuccess(result: user));
      } catch (e) {
        emit(UserEchecState(reason: e.toString()));
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
        emit(UserEchecState(reason: e.toString()));
      }
    });
  }
}

class LogoutUserBloc extends Bloc<LogoutUserEvent, UserState> {
  final LogoutUser logoutUser;
  LogoutUserBloc({required this.logoutUser}) : super(UserInitialState()) {
    on<LogoutUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        await logoutUser();
        emit(UserSuccess(result: "Déconnexion réussie"));
      } catch (e) {
        emit(UserEchecState(reason: e.toString()));
      }
    });
  }
}

// class AuthentificateUserBloc extends Bloc<UserEvent, UserState> {
//   AuthentificateUser authentificateUser;
//   AuthentificateUserBloc({required this.authentificateUser})
//       : super(UserInitialState()) {
//     on<UserEvent>((event, emit) async {
//       if (event is AuthentificateUserEvent) {
//         emit(UserLoadingState());
//         String email = event.email;
//         String password = event.password;
//         final result = await authentificateUser(email, password);
//         if (result is Succes) {
//           emit(UserSuccess<User>(result: result.value));
//         } else if (result is Echec) {
//           emit(UserEchecState(reason: result.reason));
//         }
//       }
//     });
//   }
// }

// class RegisterUserBloc extends Bloc<UserEvent, UserState> {
//   RegisterUser registerUser;
//   RegisterUserBloc({required this.registerUser}) : super(UserInitialState()) {
//     on<UserEvent>((event, emit) async {
//       if (event is RegisterUserEvent) {
//         emit(UserLoadingState());
//         String email = event.email;
//         String motDePasse = event.password;
//         String confirmerMotDePasse = event.confirmPassword;

//         if (motDePasse.isEmpty) {
//           emit(UserEchecState(
//               reason: "erreur: le mot de passe ne doit pas être vide."));
//         } else if (motDePasse != confirmerMotDePasse) {
//           emit(UserEchecState(
//               reason: "erreur: les mots de passe ne concordent pas."));
//         } else {
//           final resultat = await registerUser(email, motDePasse);
//           if (resultat is Succes) {
//             emit(UserSuccess<User>(result: resultat.value));
//           } else if (resultat is Echec) {
//             emit(UserEchecState(reason: resultat.reason));
//           }
//         }
//       }
//     });
//   }
// }
