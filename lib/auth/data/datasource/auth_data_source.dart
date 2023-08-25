import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:auth_test_app/auth/domain/entities/auth_model.dart';

class AuthDataSource {
  final String baseUrl = "http://45.10.110.181:8080";
  final String endPoint = "/api/v1/auth/login";

  Future<AuthModel>fetchAuth({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        baseUrl + endPoint,
        data: {
          "email": email,
          "password": password,
        }
      );
      if (response.statusCode == HttpStatus.ok) {
        return AuthModel.fromJson(response.data);
      } else {
        return throw Exception();
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}