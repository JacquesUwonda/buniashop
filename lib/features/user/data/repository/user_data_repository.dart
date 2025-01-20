import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/domain/entities/user.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class UserDataRepository implements UserRepository {
  final UserDatasource datasource;

  UserDataRepository(this.datasource);

  @override
  Future<User> login(String email, String password) async {
    final model = await datasource.login(email, password);
    return model.toEntity();
  }

  @override
  Future<User> register(String email, String password) async {
    final model = await datasource.register(email, password);
    return model.toEntity();
  }

  @override
  Future<void> logout() async {
    await datasource.logout();
  }
}
