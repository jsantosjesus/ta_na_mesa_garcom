import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String nome;
  final String email;
  final String estabelecimentoId;

  const User(
      {required this.uid,
      required this.nome,
      required this.email,
      required this.estabelecimentoId});

  @override
  List<Object?> get props => [uid, nome, email, estabelecimentoId];
}
