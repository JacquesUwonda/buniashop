import 'package:buniashop/core/result/result.dart';

abstract class UserRepository {
  FutureResultat authentificateUser(String email, String password);
  FutureResultat registerUser(String email, String password);
}
