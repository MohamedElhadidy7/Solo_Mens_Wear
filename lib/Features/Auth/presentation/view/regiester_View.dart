import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';
import 'package:solo/Features/Auth/presentation/Manger/Register_Cubit/register_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/register_View_Body.dart';

class RegiesterView extends StatelessWidget {
  const RegiesterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(AuthReposImpl(apiservice: Apiservice(Dio()))),
      child: const Scaffold(body: RegisterViewBody()),
    );
  }
}
