import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class AuthentificateUser {
  final UserRepository repository;

  AuthentificateUser({required this.repository});

  FutureResultat call(String email, String password) {
    return repository.authentificateUser(email, password);
  }
}
