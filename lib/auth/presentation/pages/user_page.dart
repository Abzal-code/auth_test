import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_test_app/auth/domain/entities/user_model.dart';
import 'package:auth_test_app/auth/presentation/cubit/auth_cubit.dart';

class UserPage extends StatelessWidget {
  final UserModel userModel;
  const UserPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(Icons.account_circle_outlined, size: 100,),
                  Text(
                    userModel.nickname,
                    style: const TextStyle(
                      fontSize: 25
                    ),
                  ),
                  Text(userModel.email,
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => context.read<AuthCubit>().logout(),
                child: const Text('LogOut'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
