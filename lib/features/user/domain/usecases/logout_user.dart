import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class LogoutUser {
  final UserRepository repository;

  LogoutUser(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}
