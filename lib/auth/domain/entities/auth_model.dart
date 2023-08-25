// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:auth_test_app/auth/domain/entities/tokens_model.dart';
import 'package:auth_test_app/auth/domain/entities/user_model.dart';

class AuthModel extends Equatable {
  final TokensModel tokens;
  final UserModel user;

  const AuthModel({
    required this.tokens,
    required this.user,
  });

  @override
  List<Object> get props => [
        tokens,
        user,
      ];

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      tokens: TokensModel.fromJson(json["tokens"]),
      user: UserModel.fromJson(json["user"]),
    );
  }
}
