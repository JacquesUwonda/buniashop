import 'package:watertank/core/resultat/resultat.dart';
import 'package:watertank/features/utilisateur/domain/repository/utilisateur_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watertank/features/utilisateur/domain/usecases/authentifier_utilisateur.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUtilisateurRepository extends Mock implements UtilisateurRepository{}

void main(){
  late MockUtilisateurRepository repository;
  late AuthentifierUtilisateur authentifierUtilisateur;
  setUp((){
    repository = MockUtilisateurRepository();
    authentifierUtilisateur = AuthentifierUtilisateur(repository: repository);
  });

  test('devrait appeler [UtilisateurRepository.authentifierUtilisateur]', () async{
    when(()=> repository.authentifierUtilisateur("test@gmail.com", "aaaa")).thenAnswer( (_) async => Succes<int>(valeur:1) ); // Creer un comportement simulé de la fonction authentifierUtilisateur
    await authentifierUtilisateur("test@gmail.com","aaaa");
    verify(()=> repository.authentifierUtilisateur("test@gmail.com", "aaaa"));
  });
}