import 'package:watertank/core/exceptions/exceptions.dart';
import 'package:watertank/core/resultat/resultat.dart';
import 'package:watertank/features/utilisateur/data/datasource/utilisateur_datasource.dart';
import 'package:watertank/features/utilisateur/data/repository/data_utilisateur_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUtilisateurDatasource extends Mock implements UtilisateurDatasource{}

void main(){
  late MockUtilisateurDatasource datasource;
  late DataUtilisateurRepository dataUtilisateurRepository;
  setUp((){
    datasource = MockUtilisateurDatasource();
    dataUtilisateurRepository = DataUtilisateurRepository(datasource: datasource);
  });

  group("[DataUtilisateurRepository.authentifierUtilisateur]", (){
    test('devrait retourner [Succes<int>(valeur:1)]', () async{
      when(()=> datasource.authentifierUtilisateur('test@gmail.com', 'aaaa')).thenAnswer((_) async => Succes<int>(valeur: 1));
      var resultat = await dataUtilisateurRepository.authentifierUtilisateur('test@gmail.com', 'aaaa');
      expect(resultat, Succes<int>(valeur: 1));
    });

    test('devrait retourner [Echec(raison:"erreur serveur")]]', () async{
      when(()=> datasource.authentifierUtilisateur('test@gmail.com', 'aaaa')).thenThrow(ServerException(raison:"erreur serveur"));
      var resultat = await dataUtilisateurRepository.authentifierUtilisateur('test@gmail.com', 'aaaa');
      expect(resultat,Echec(raison: "erreur serveur"));
    });
  });

  group("[DataUtilisateurRepository.enregistrerUtilisateur]", (){
    test('devrait retourner [Succes<int>(valeur:1)]', () async{
      when(()=> datasource.enregistrerUtilisateur('test@gmail.com', 'aaaa')).thenAnswer((_) async => Succes<int>(valeur: 1));
      var resultat = await dataUtilisateurRepository.enregistrerUtilisateur('test@gmail.com', 'aaaa');
      expect(resultat, Succes<int>(valeur: 1));
    });

    test('devrait retourner [Echec(raison:"erreur serveur")]]', () async{
      when(()=> datasource.enregistrerUtilisateur('test@gmail.com', 'aaaa')).thenThrow(ServerException(raison:"erreur serveur"));
      var resultat = await dataUtilisateurRepository.enregistrerUtilisateur('test@gmail.com', 'aaaa');
      expect(resultat,Echec(raison: "erreur serveur"));
    });
  });

  group("[DataUtilisateurRepository.modifierProfilUtilisateur]", (){
    test('devrait retourner [Succes<bool>(valeur:true)]', () async{
      when(()=> datasource.modifierProfilUtilisateur(1, 'aaaa')).thenAnswer((_) async => Succes<bool>(valeur: true));
      var resultat = await dataUtilisateurRepository.modifierProfilUtilisateur(1, 'aaaa');
      expect(resultat, Succes<bool>(valeur: true));
    });

    test('devrait retourner [Echec(raison:"erreur serveur")]]', () async{
      when(()=> datasource.modifierProfilUtilisateur(1, 'aaaa')).thenThrow(ServerException(raison:"erreur serveur"));
      var resultat = await dataUtilisateurRepository.modifierProfilUtilisateur(1, 'aaaa');
      expect(resultat,Echec(raison: "erreur serveur"));
    });
  });
}