import 'package:dartz/dartz.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/errorsLogin/error_login.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/repositories/login_repository.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/usecase/login_by_email_password_firebase.dart';
import 'package:ta_na_mesa_garcom/modules/login/domain/utils/valid_email_password.dart';

class LoginByEmailPasswordFirebaseImpl extends LoginByEmailPasswordFirebase {
  final LoginRepository repository;

  final ValidEmailPassword validEmailPassword;

  LoginByEmailPasswordFirebaseImpl(
      {required this.repository, required this.validEmailPassword});

  @override
  Future<Either<ErrorLogin, UserEntity>> call(
      String email, String password) async {
    final isEmail = validEmailPassword.isValidEmail(email);
    final isPassword = validEmailPassword.isValidPassword(password);

    if (!isEmail || !isPassword) {
      return Left(ErrorLogin(message: 'Email ou senha invalidos'));
    }

    return await repository.login(email, password);
  }
}
