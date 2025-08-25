import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Core/Utils/App_Router.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';
import 'package:solo/Features/Auth/presentation/Manger/External_Login_Cubit/external_login_cubit.dart';
import 'package:solo/Features/Auth/presentation/Manger/Reset_Password_Cubit/reset_password_cubit.dart';

void main() async {
  Animate.restartOnHotReload = true;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ResetPasswordCubit(
                AuthReposImpl(apiservice: Apiservice(Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => ExternalLoginCubit(
                AuthReposImpl(apiservice: Apiservice(Dio())),
              ),
            ),
          ],
          child: MaterialApp.router(
            theme: ThemeData(fontFamily: 'Rubik'),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..dismissOnTap = false;
}
