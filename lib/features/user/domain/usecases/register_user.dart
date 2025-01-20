import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class RegisterUser {
  final UserRepository repository;

  RegisterUser(this.repository);

  Future<User> call(String email, String password) {
    return repository.register(email, password);
  }
}
