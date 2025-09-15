import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:solo/Core/Utils/Assets_Data.dart';
import 'package:solo/Features/Auth/presentation/Manger/External_Login_Cubit/external_login_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/SocialMediaBotton.dart';

class Socialmediasection extends StatefulWidget {
  const Socialmediasection({super.key});

  @override
  State<Socialmediasection> createState() => _SocialmediasectionState();
}

class _SocialmediasectionState extends State<Socialmediasection> {
  Future<void> _signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      final account = await googleSignIn.signIn();

      if (account != null) {
        final email = account.email;
        final name = account.displayName ?? '';
        final providerKey = account.id;

        await context.read<ExternalLoginCubit>().loginWithGoogle(
          providerKey: providerKey,
          email: email,
          name: name,
        );
      }
    } catch (e) {
      debugPrint("Google sign in error: $e");
      if (mounted) {
        EasyLoading.showError("خطأ في تسجيل الدخول بجوجل");
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {

      await FacebookAuth.instance.logOut();


      final result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );



      if (result.status == LoginStatus.success) {


        final userData = await FacebookAuth.instance.getUserData(
          fields: "name,email,id,picture.width(200)",
        );



        final email = userData['email']?.toString();
        final name = userData['name']?.toString();
        final providerKey = userData['id']?.toString();



        if (providerKey != null && providerKey.isNotEmpty) {


          await context.read<ExternalLoginCubit>().loginWithFacebook(
            providerKey: providerKey,
            email: email ?? 'no-email@facebook.com',
            name: name ?? 'Facebook User',
          );
        } else {

          throw Exception("لم يتم الحصول على معرف المستخدم من فيسبوك");
        }
      }
    } catch (e) {

      EasyLoading.showError("خطأ في تسجيل الدخول بفيسبوك: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExternalLoginCubit, ExternalLoginState>(
      listener: (context, state) {
        if (state is ExternalLoginLoading) {
          EasyLoading.show(status: 'Wait..');
        } else if (state is ExternalLoginSucsess) {

          GoRouter.of(context).go('/Home');
        } else if (state is ExternalLoginFaliure) {
          EasyLoading.showError(
            state.errorMessage.replaceAll('Exception: ', ''),
          );
        } else {
          EasyLoading.dismiss(); // لإخفاء أي EasyLoading إذا لم يكن Loading
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Socialmediabotton(
            onPressed: () => _signInWithGoogle(context),
            imagedata: AssetsData.google,
            data: 'Google',
          ),
          SizedBox(width: 12.w),
          Socialmediabotton(
            onPressed: () => _signInWithFacebook(context),
            imagedata: AssetsData.facebook,
            data: 'Facebook',
          ),
        ],
      ),
    );
  }
}
