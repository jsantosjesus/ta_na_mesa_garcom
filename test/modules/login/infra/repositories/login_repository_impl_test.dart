import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';
import 'package:ta_na_mesa_garcom/modules/login/infra/datasource/login_datasource.dart';
import 'package:ta_na_mesa_garcom/modules/login/infra/repositories/login_repository_impl.dart';

class LoginDataSourceMock extends Mock implements LoginDatasource {}

void main() {
  final datasource = LoginDataSourceMock();
  final repository = LoginRepositoryImpl(datasource: datasource);

  test(
      'Caso aconteça algum erro no datasource, o repository deve retornar um ErrorLogin',
      () async {
    //Arrange
    when(() => datasource.login(any(), any())).thenThrow(Exception());

    //Act
    final result = await repository.login('jadsoonbol@gmail.com', '123Senh@');

    //Assert
    expect(result.fold((error) => error, (_) => null), isA<ErrorLogin>());
  });

  test('Deve retornar um left de user caso ocorra tudo certo', () async {
    //Arrange
    when(() => datasource.login(any(), any())).thenAnswer((_) async =>
        const UserEntity(uid: '', nome: '', email: '', estabelecimentoId: ''));

    //Act
    final result = await repository.login('jadsoonbol@gmail.com', '123Senh@');

    //Assert
    expect(result.fold((l) => l, (r) => r), isA<UserEntity>());
  });
}
