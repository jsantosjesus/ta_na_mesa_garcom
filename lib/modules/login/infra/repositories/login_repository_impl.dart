import 'package:dartz/dartz.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/repositories/login_repository.dart';
import 'package:ta_na_mesa_garcom/modules/login/infra/datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<Either<ErrorLogin, UserEntity>> login(
      String email, String password) async {
    try {
      final result = await datasource.login(email, password);
      return Right(result);
    } catch (e) {
      return Left(ErrorLogin(message: 'Email ou senha invalidos'));
    }
  }
}
