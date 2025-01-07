import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UtilisateurState extends Equatable {
  @override
  List<Object> get props => [];
}

final class UtilisateurInitial extends UtilisateurState {}

final class UtilisateurLoading extends UtilisateurState {}

final class UtilisateurSucces<T extends Object> extends UtilisateurState {
  final T resultat;
  UtilisateurSucces({required this.resultat});

  @override
  List<Object> get props => [resultat];
}

final class UtilisateurEchec extends UtilisateurState {
  final String raison;
  UtilisateurEchec({required this.raison});

  @override
  List<Object> get props => [raison];
}
