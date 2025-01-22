import 'package:buniashop/features/user/domain/repository/user_repository.dart';
import 'package:buniashop/features/user/domain/usecases/logout_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository mockRepository;
  late LogoutUser logoutUser;

  setUp(() {
    mockRepository = MockUserRepository();
    logoutUser = LogoutUser(mockRepository);
  });

  group('[LogoutUser]', () {
    test('should complete without errors when logout is successful', () async {
      when(() => mockRepository.logout()).thenAnswer((_) async {});

      await logoutUser.call();
      verify(() => mockRepository.logout()).called(1);
    });

    test('should throw an exception when logout fails', () async {
      when(() => mockRepository.logout()).thenThrow(Exception('Logout failed'));

      expect(
        () => logoutUser.call(),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.logout()).called(1);
    });
  });
}
