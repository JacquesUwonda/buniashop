import 'package:buniashop/core/exceptions/exceptions.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';

class DataUserRepository extends UserRepository {
  UserDatasource datasource;
  DataUserRepository({required this.datasource});

  @override
  FutureResultat authentificateUser(String email, String password) async {
    try {
      return await datasource.authentificateUser(email, password);
    } on ServerException catch (e) {
      return Echec(reason: e.reason);
    }
  }

  @override
  FutureResultat registerUser(String email, String password) async {
    try {
      return await datasource.registerUser(email, password);
    } on ServerException catch (e) {
      return Echec(reason: e.reason);
    }
  }
}
