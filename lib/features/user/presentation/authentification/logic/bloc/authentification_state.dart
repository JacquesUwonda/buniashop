import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserSuccess<T extends Object> extends UserState {
  final T result;
  UserSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

final class UserEchecState extends UserState {
  final String reason;
  UserEchecState({required this.reason});

  @override
  List<Object> get props => [reason];
}
