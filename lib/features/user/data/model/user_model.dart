import 'package:buniashop/features/user/domain/entities/user.dart';

class UserModel {
  final String token;
  final String id;
  final String email;

  UserModel({required this.token, required this.id, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      id: json['id'],
      email: json['email'],
    );
  }

  User toEntity() {
    return User(token: token, id: id, email: email);
  }
}
