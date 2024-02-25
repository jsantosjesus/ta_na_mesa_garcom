import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/repositories/login_repository.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase_impl.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/utils/valid_email_password.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final isEmailOrIsPassword = ValidEmailPassword();

  final usecase = LoginByEmailPasswordFirebaseImpl(
      repository: repository, validEmailPassword: isEmailOrIsPassword);

  test('Teste se o email é válido', () async {
    // Act
    final result = await usecase('email', '123Senh@');

    // Assert
    expect(result.fold((error) => error, (_) => null), isA<ErrorLogin>());
  });

  test('Teste se a senha é válida', () async {
    // Act
    final result = await usecase('jadsoonbol@gmail.com', '123senha');

    // Assert
    expect(result.fold((error) => error, (_) => null), isA<ErrorLogin>());
  });

  test('Testando caso de sucesso', () async {
    const user = UserEntity(
        uid: 'uid',
        nome: 'nome',
        email: 'email',
        estabelecimentoId: 'estabelecimentoId');

    //Arrage
    when(() => repository.login(any(), any()))
        .thenAnswer((_) async => const Right(user));

    // Act
    final result = await usecase('jadsoonbol@gmail.com', '123Senh@');

    // Assert
    expect(result, const Right(user));
  });
}
