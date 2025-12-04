import 'package:backend_flutter/cubit/create_users/create_user_cubit.dart';
import 'package:backend_flutter/repository/auth_repository.dart';
import 'package:backend_flutter/screen/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserCubit>(create: (_) => CreateUserCubit(AuthRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const AuthScreen(),
      ),
    );
  }
}