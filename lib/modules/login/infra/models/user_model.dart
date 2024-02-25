import 'dart:convert';
import 'package:ta_na_mesa_garcom/modules/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String uid;
  final String nome;
  final String email;
  final String estabelecimentoId;

  const UserModel(
      {required this.uid,
      required this.nome,
      required this.email,
      required this.estabelecimentoId})
      : super(uid: '', nome: '', email: '', estabelecimentoId: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': uid,
      'nome': nome,
      'email': email,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['id'],
        nome: map['nome'],
        email: map['email'],
        estabelecimentoId: map['estabelecimento_id']);
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));
}
