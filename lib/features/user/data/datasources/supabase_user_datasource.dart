import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/model/user_model.dart';
import 'package:supabase/supabase.dart';

class SupabaseUserDatasource implements UserDatasource {
  final SupabaseClient client;

  SupabaseUserDatasource(this.client);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      return UserModel(
        id: response.user!.id,
        email: response.user!.email!,
        token: '',
      );
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<UserModel> register(String email, String password) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
      return UserModel(
        id: response.user!.id,
        email: response.user!.email!,
        token: '',
      );
    } else {
      throw Exception('Registration failed');
    }
  }

  @override
  Future<void> logout() async {
    await client.auth.signOut();
  }
}
