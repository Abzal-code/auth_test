import 'package:auth_test_app/auth/domain/entities/auth_model.dart';

abstract class AuthRepository {

  Future<AuthModel>login(
     String email,
     String password,
  );

  Future<void> logout();

}