import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/auth_repository_impl.dart';
import '../../domain/entities/auth_model.dart';
import '../../domain/repositories/i_auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      AuthModel authModel = await _authRepository.login(email, password);
      emit(AuthSuccess(authModel));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await Future.delayed(
      const Duration(seconds: 1),
    );
    emit(AuthInitial());
  }
}