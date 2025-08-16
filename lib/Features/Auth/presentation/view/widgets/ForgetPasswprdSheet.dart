import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';
import 'package:solo/Features/Auth/presentation/Manger/Reset_Password_Cubit/reset_password_cubit.dart';
import 'OtpSheet.dart';

class ForgetPasswordSheet extends StatefulWidget {
  const ForgetPasswordSheet({super.key});

  @override
  State<ForgetPasswordSheet> createState() => _ForgetPasswordSheetState();
}

class _ForgetPasswordSheetState extends State<ForgetPasswordSheet> {
  TextEditingController forgetpasswordcontroller = TextEditingController();
  _ForgetPasswordSheetState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Forget Password', style: AppStyles.textstyle28),
            ),
            Text(
              'Enter your email for the verification process, we will send 4 digits code to your email',
              style: AppStyles.textstyle14.copyWith(color: Color(0xff7A7A7B)),
            ),
            SizedBox(height: 16.h),
            SingleChildScrollView(
              child: CustomTextformfield(
                hint: 'Enter your Email',
                controller: forgetpasswordcontroller,
              ),
            ),
            SizedBox(height: 30.h),

            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordloading) {
                  EasyLoading.show(status: 'Wait..');
                } else if (state is ResetPasswordSucsess) {
                  EasyLoading.dismiss();
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => const OtpSheet(),
                  );
                } else if (state is ResetPasswordFaliure) {
                  EasyLoading.dismiss();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errmessage)));
                }
              },
              builder: (context, state) {
                return CustomButton(
                  textbutton: 'Continue',
                  onPressed: () {
                    BlocProvider.of<ResetPasswordCubit>(
                      context,
                    ).UserForgetPassword(email: forgetpasswordcontroller.text);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
