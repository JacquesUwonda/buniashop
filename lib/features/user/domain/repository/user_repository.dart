import 'package:buniashop/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}
