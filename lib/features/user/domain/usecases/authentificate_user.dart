import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class AuthentificateUser {
  final UserRepository repository;

  AuthentificateUser(this.repository);

  Future<User> call(String email, String password) {
    return repository.login(email, password);
  }
}
