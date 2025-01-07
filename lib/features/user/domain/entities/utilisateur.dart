import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String email;
  final String authId;
  const User({this.userId = 0, this.email = "", this.authId = ""});

  @override
  List<Object?> get props => [userId, email, authId];
}
