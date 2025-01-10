import 'package:buniashop/features/user/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({super.userId, super.email, super.authId});

  Map<dynamic, dynamic> toJSON() {
    return {
      "userId": userId,
      "email": email,
      "auth_id": authId,
    };
  }

  factory UserModel.fromJSON(Map<dynamic, dynamic> json) {
    var userId = json["userId"];
    var email = json["email"];
    var authId = json["auth_id"];
    return UserModel(userId: userId, email: email, authId: authId);
  }
}
