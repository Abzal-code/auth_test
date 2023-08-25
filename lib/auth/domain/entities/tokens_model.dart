import 'package:equatable/equatable.dart';

class TokensModel extends Equatable {
  const TokensModel({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [
        accessToken,
        refreshToken,
      ];


  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(accessToken: json["accessToken"], refreshToken: json["refreshToken"]);
}
