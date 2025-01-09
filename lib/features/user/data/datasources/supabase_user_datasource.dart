import 'package:buniashop/core/exceptions/exceptions.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/model/user_model.dart';
import 'package:supabase/supabase.dart';

class SupabaseUserDatasource extends UserDatasource {
  SupabaseClient supabaseClient;

  SupabaseUserDatasource({required this.supabaseClient});
  @override
  FutureResultat authentificateUser(String email, String password) async {
    try {
      var res1 = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      var authId = res1.user!.id;
      var res2 =
          await supabaseClient.from('users').select().eq('auth_id', authId);
      var user = UserModel.fromJSON(res2[0]);
      return Succes<UserModel>(value: user);
    } on AuthException catch (e) {
      throw ServerException(reason: "incorrect credentials");
    } catch (e) {
      throw ServerException(reason: "server error");
    }
  }

  @override
  FutureResultat registerUser(String email, String password) async {
    try {
      var res1 =
          await supabaseClient.auth.signUp(email: email, password: password);
      var authId = res1.user!.id;
      var res2 =
          await supabaseClient.from('users').select().eq('auth_id', authId);
      var user = UserModel.fromJSON(res2[0]);
      return Succes<UserModel>(value: user);
    } on AuthException catch (e) {
      print(e);
      throw ServerException(reason: "incorrect credentials");
    } catch (e) {
      throw ServerException(reason: "server error");
    }
  }
}
