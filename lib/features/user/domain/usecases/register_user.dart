import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class RegisterUser {
  final UserRepository repository;

  RegisterUser({required this.repository});

  FutureResultat call(String email, String password) {
    return repository.registerUser(email, password);
  }
}
