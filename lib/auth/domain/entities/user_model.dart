import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.email,
    required this.nickname,
  });

  final int id;
  final String email;
  final String nickname;

  @override
  List<Object> get props => [
        id,
        email,
        nickname,
      ];


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(id: json['id'], email: json['email'], nickname: json['nickname']);
}
