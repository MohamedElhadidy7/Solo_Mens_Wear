import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';
import 'package:solo/Features/Auth/presentation/Manger/Reset_Password_Cubit/reset_password_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/CustomOtp.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/reset_Password.dart';

class OtpSheet extends StatefulWidget {
  final String email;
  const OtpSheet({super.key, required this.email});

  @override
  State<OtpSheet> createState() => _OtpSheetState();
}

class _OtpSheetState extends State<OtpSheet> {
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResetPasswordCubit>().setEmail(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordloading) {
          EasyLoading.show(status: 'Wait..');
        } else if (state is ResetPasswordSucsess) {
          EasyLoading.dismiss();
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) {
              return BlocProvider.value(
                value: context.read<ResetPasswordCubit>(),
                child: const ResetPassword(),
              );
            },
          );
        } else if (state is ResetPasswordFaliure) {
          EasyLoading.showError(state.errmessage);
        }
      },
      builder: (context, state) {
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
                  child: Text(
                    'Enter 4 Digits Code',
                    style: AppStyles.textstyle28,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Enter the 4 digits code that you received on your email.',
                  style: AppStyles.textstyle14.copyWith(
                    color: const Color(0xff7A7A7B),
                  ),
                ),
                SizedBox(height: 16.h),

                CustomOtp(
                  otpController: otpController,
                  onCompleted: (value) {
                    final cubit = context.read<ResetPasswordCubit>();
                    cubit.userVerifyOtp(otp: value);
                  },
                ),
                SizedBox(height: 30.h),

                CustomButton(
                  textbutton: 'Continue',
                  onPressed: () {
                    final cubit = context.read<ResetPasswordCubit>();
                    cubit.userVerifyOtp(otp: otpController.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
