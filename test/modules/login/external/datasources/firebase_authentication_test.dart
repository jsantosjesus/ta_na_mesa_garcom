// import 'package:either_dart/either.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ta_na_mesa_garcom/modules/login/external/datasources/firebase_authentication.dart';
// import 'package:ta_na_mesa_garcom/modules/login/external/datasources/firestore_get_user.dart';

// class FirebaseAuthMock extends Mock implements FirebaseAuth {}

// class UserCredentialMock extends Mock implements UserCredential {}

// void main() {
//   final firebaseAuth = FirebaseAuthMock();
//   final getUser = FirestoreGetUser();
//   final datasource = FirebaseAuthetication(getUser);

//   setUp(() {
//     // Configurar o mock para retornar um UserCredential válido ao chamar signInWithEmailAndPassword
//     when(() => firebaseAuth.signInWithEmailAndPassword(
//           email: any(named: 'email'),
//           password: any(named: 'password'),
//         )).thenAnswer((_) async => UserCredentialMock());
//   });

//   test('Teste de login com sucesso', () async {
//     // Arrange

//     // Act
//     final result = await datasource.login('jadsoonbol@gmail.com', '123Senh@');

//     // Assert
//     expect(result, isA<Right>());
//   });

//   // Adicione mais testes conforme necessário
// }
