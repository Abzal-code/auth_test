import 'package:auth_test_app/auth/data/datasource/auth_data_source.dart';
import 'package:auth_test_app/auth/domain/entities/auth_model.dart';
import 'package:auth_test_app/auth/domain/entities/common/error_model.dart';
import 'package:auth_test_app/auth/domain/repositories/i_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository  {
  final _dataSource = AuthDataSource();

  @override
  Future<AuthModel> login(
    String email,
    String password,
  ) async {
    try {
      final AuthModel data = await _dataSource.fetchAuth(
        email: email,
        password: password,
      );
      return data;
    } catch (e) {
      throw mapToErrorModel(e);
    }
  }

  @override
  Future<void> logout() async {}
}
