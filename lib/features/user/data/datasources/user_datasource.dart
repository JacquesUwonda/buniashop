import 'package:buniashop/features/user/data/model/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
  Future<void> logout();
}
