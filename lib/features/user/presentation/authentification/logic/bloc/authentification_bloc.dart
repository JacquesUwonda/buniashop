import 'package:bloc/bloc.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/entities/utilisateur.dart';
import 'package:buniashop/features/user/domain/usecases/authentificate_user.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_event.dart';
import 'package:buniashop/features/user/presentation/authentification/logic/bloc/authentification_state.dart';

class UtilisateurAuthentifierBloc
    extends Bloc<UtilisateurEvent, UtilisateurState> {
  AuthentificateUser authentifierUtilisateur;
  UtilisateurAuthentifierBloc({required this.authentifierUtilisateur})
      : super(UtilisateurInitial()) {
    on<UtilisateurEvent>((event, emit) async {
      if (event is UtilisateurAuthentifierEvent) {
        emit(UtilisateurLoading());
        String email = event.email;
        String motDePasse = event.motDePasse;
        final resultat = await authentifierUtilisateur(email, motDePasse);
        if (resultat is Succes) {
          emit(UtilisateurSucces<User>(resultat: resultat.value));
        } else if (resultat is Echec) {
          emit(UtilisateurEchec(raison: resultat.reason));
        }
      }
    });
  }
}

class UtilisateurEnregistrerBloc
    extends Bloc<UtilisateurEvent, UtilisateurState> {
  RegisterUser enregistrerUtilisateur;
  UtilisateurEnregistrerBloc({required this.enregistrerUtilisateur})
      : super(UtilisateurInitial()) {
    on<UtilisateurEvent>((event, emit) async {
      if (event is UtilisateurEnregistrerEvent) {
        emit(UtilisateurLoading());
        String email = event.email;
        String motDePasse = event.motDePasse;
        String confirmerMotDePasse = event.confirmerMotDePasse;

        if (motDePasse.isEmpty) {
          emit(UtilisateurEchec(
              raison: "erreur: le mot de passe ne doit pas être vide."));
        } else if (motDePasse != confirmerMotDePasse) {
          emit(UtilisateurEchec(
              raison: "erreur: les mots de passe ne concordent pas."));
        } else {
          final resultat = await enregistrerUtilisateur(email, motDePasse);
          if (resultat is Succes) {
            emit(UtilisateurSucces<User>(resultat: resultat.value));
          } else if (resultat is Echec) {
            emit(UtilisateurEchec(raison: resultat.reason));
          }
        }
      }
    });
  }
}
