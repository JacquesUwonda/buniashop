import 'package:buniashop/core/exceptions/exceptions.dart';
import 'package:buniashop/core/result/result.dart';
import 'package:buniashop/features/user/data/datasources/user_datasource.dart';
import 'package:buniashop/features/user/data/repository/user_data_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserDatasource extends Mock implements UserDatasource {}

void main() {
  late MockUserDatasource datasource;
  late UserDataRepository userDataRepository;
  setUp(() {
    datasource = MockUserDatasource();
    userDataRepository = UserDataRepository(datasource: datasource);
  });

  group("[UserDataRepository.authentificateUser]", () {
    test('returning [Succes<int>(value:1)]', () async {
      when(() => datasource.authentificateUser('test@gmail.com', 'aaaa'))
          .thenAnswer((_) async => Succes<int>(value: 1));
      var resultat =
          await userDataRepository.authentificateUser('test@gmail.com', 'aaaa');
      expect(resultat, Succes<int>(value: 1));
    });

    test('returning [Echec(reason:"erreur serveur")]]', () async {
      when(() => datasource.authentificateUser('test@gmail.com', 'aaaa'))
          .thenThrow(ServerException(reason: "erreur serveur"));
      var resultat =
          await userDataRepository.authentificateUser('test@gmail.com', 'aaaa');
      expect(resultat, Echec(reason: "erreur serveur"));
    });
  });

  group("[UserDataRepository.registerUser]", () {
    test('returning [Succes<int>(value:1)]', () async {
      when(() => datasource.registerUser('test@gmail.com', 'aaaa'))
          .thenAnswer((_) async => Succes<int>(value: 1));
      var resultat =
          await userDataRepository.registerUser('test@gmail.com', 'aaaa');
      expect(resultat, Succes<int>(value: 1));
    });

    test('devrait retourner [Echec(raison:"erreur serveur")]]', () async {
      when(() => datasource.registerUser('test@gmail.com', 'aaaa'))
          .thenThrow(ServerException(reason: "erreur serveur"));
      var resultat =
          await userDataRepository.registerUser('test@gmail.com', 'aaaa');
      expect(resultat, Echec(reason: "erreur serveur"));
    });
  });
}
