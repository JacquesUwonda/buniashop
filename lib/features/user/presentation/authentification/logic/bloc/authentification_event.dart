import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UtilisateurEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class UtilisateurAuthentifierEvent extends UtilisateurEvent {
  final String email;
  final String motDePasse;

  UtilisateurAuthentifierEvent({this.email = "", this.motDePasse = ""});

  @override
  List<Object> get props => [email, motDePasse];
}

final class UtilisateurEnregistrerEvent extends UtilisateurEvent {
  final String email;
  final String motDePasse;
  final String confirmerMotDePasse;

  UtilisateurEnregistrerEvent(
      {this.email = "", this.motDePasse = "", this.confirmerMotDePasse = ""});

  @override
  List<Object> get props => [email, motDePasse, confirmerMotDePasse];
}
