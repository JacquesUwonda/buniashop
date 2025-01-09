import 'package:watertank/core/resultat/resultat.dart';
import 'package:watertank/features/utilisateur/domain/repository/utilisateur_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watertank/features/utilisateur/domain/usecases/enregistrer_utilisateur.dart';

class MockUtilisateurRepository extends Mock implements UtilisateurRepository{}

void main(){
  late MockUtilisateurRepository repository;
  late EnregistrerUtilisateur enregistrerUtilisateur;
  setUp((){
    repository = MockUtilisateurRepository();
    enregistrerUtilisateur = EnregistrerUtilisateur(repository: repository);
  });

  test('devrait appeler [UtilisateurRepository.enregistrerUtilisateur]', () async{
    when(()=> repository.enregistrerUtilisateur("test@gmail.com", "aaaa")).thenAnswer( (_) async => Succes<int>(valeur:1) ); // Creer un comportement simulé de la fonction authentifierUtilisateur
    await enregistrerUtilisateur("test@gmail.com","aaaa");
    verify(()=> repository.enregistrerUtilisateur("test@gmail.com", "aaaa"));
  });
}