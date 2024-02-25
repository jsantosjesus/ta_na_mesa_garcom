import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';

abstract class LoginDatasource {
  Future<UserEntity> login(String email, String password);
}
