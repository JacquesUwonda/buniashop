import 'package:buniashop/core/result/result.dart';

abstract class UserDatasource {
  FutureResultat authentificateUser(String email, String password);
  FutureResultat registerUser(String email, String password);
}
