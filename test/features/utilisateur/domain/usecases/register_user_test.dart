import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/register_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository repository;
  late RegisterUser registerUser;
  setUp(() {
    repository = MockUserRepository();
    registerUser = RegisterUser(repository: repository);
  });

  test('calling [UserRepository.registerUser]', () async {
    when(() => repository.registerUser("test@gmail.com", "aaaa"))
        .thenAnswer((_) async => Succes<int>(value: 1));
    await registerUser("test@gmail.com", "aaaa");
    verify(() => repository.registerUser("test@gmail.com", "aaaa"));
  });
}
