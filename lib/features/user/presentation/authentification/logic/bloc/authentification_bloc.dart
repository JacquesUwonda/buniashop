import 'package:bloc/bloc.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';

class AuthentificateUserBloc extends Bloc<UserEvent, UserState> {
  AuthentificateUser authentificateUser;
  AuthentificateUserBloc({required this.authentificateUser})
      : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is AuthentificateUserEvent) {
        emit(UserLoadingState());
        String email = event.email;
        String password = event.password;
        final result = await authentificateUser(email, password);
        if (result is Succes) {
          emit(UserSuccess<User>(result: result.value));
        } else if (result is Echec) {
          emit(UserEchecState(raison: result.reason));
        }
      }
    });
  }
}

class RegisterUserBloc extends Bloc<UserEvent, UserState> {
  RegisterUser registerUser;
  RegisterUserBloc({required this.registerUser}) : super(UserInitialState()) {
    on<UserEvent>((event, emit) async {
      if (event is RegisterUserEvent) {
        emit(UserLoadingState());
        String email = event.email;
        String motDePasse = event.password;
        String confirmerMotDePasse = event.confirmPassword;

        if (motDePasse.isEmpty) {
          emit(UserEchecState(
              raison: "erreur: le mot de passe ne doit pas être vide."));
        } else if (motDePasse != confirmerMotDePasse) {
          emit(UserEchecState(
              raison: "erreur: les mots de passe ne concordent pas."));
        } else {
          final resultat = await registerUser(email, motDePasse);
          if (resultat is Succes) {
            emit(UserSuccess<User>(result: resultat.value));
          } else if (resultat is Echec) {
            emit(UserEchecState(raison: resultat.reason));
          }
        }
      }
    });
  }
}
