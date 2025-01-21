import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthentificateUserEvent extends UserEvent {
  final String email;
  final String password;

  AuthentificateUserEvent({this.email = "", this.password = ""});

  @override
  List<Object> get props => [email, password];
}

final class RegisterUserEvent extends UserEvent {
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserEvent(
      {this.email = "", this.password = "", this.confirmPassword = ""});

  @override
  List<Object> get props => [email, password, confirmPassword];
}

final class LogoutUserEvent extends UserEvent {}
