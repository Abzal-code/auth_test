import 'package:auth_test_app/auth/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_test_app/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_test_app/auth/presentation/pages/auth_page.dart';
import 'package:auth_test_app/auth/presentation/pages/user_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        home: Scaffold(
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                errorMessage(context);
              }
            },
            builder: (context, state) {
              if (state is AuthSuccess) {
                return UserPage(userModel: state.authModel.user);
              } else if (state is AuthError) {
                return const AuthPage();
              } else if (state is AuthInitial) {
                return const AuthPage();
              } else if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Text("data");
              }
            },
          ),
        ),
      ),
    );
  }
}
