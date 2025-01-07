import 'package:equatable/equatable.dart';

abstract class Result extends Equatable {}

class Succes<T> extends Result {
  T value;
  Succes({required this.value});
  @override
  List<Object?> get props => [value];
}

class Echec extends Result {
  String reason;
  Echec({this.reason = ""});
  @override
  List<Object?> get props => [reason];
}

typedef FutureResultat = Future<Result>;
