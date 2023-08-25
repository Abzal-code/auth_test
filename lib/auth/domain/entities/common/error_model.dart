import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

ErrorModel mapToErrorModel(dynamic error) {
  if (error is ErrorModel) {
    return error;
  }

  if (error is DioException) {
    if (error.response?.data != null && error.response?.data is Map) {
      final errorModel = ErrorModel.fromJson(error.response?.data);

      return errorModel;
    }

    return const ErrorModel(
      message: 'Что-то пошло не так',
    );
  }

  return const ErrorModel(
    message: 'Что-то пошло не так',
  );
}

class ErrorModel extends Equatable {
  const ErrorModel({
    required this.message,
    this.code = 1,
    this.data,
  });

  final int? code;
  final String message;
  final dynamic data;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json['code'],
        data: json['data'],
        message: json['message'],
      );

  @override
  List<Object?> get props => [
        code,
        data,
        message,
      ];
}
