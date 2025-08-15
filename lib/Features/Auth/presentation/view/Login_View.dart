import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';
import 'package:solo/Features/Auth/presentation/Manger/Login_Cubit/login_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Login_View_Body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(AuthReposImpl(apiservice: Apiservice(Dio()))),
      child: Scaffold(body: LoginViewBody()),
    );
  }
}
