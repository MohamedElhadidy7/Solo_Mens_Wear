import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'package:solo/Features/Auth/presentation/Manger/Reset_Password_Cubit/reset_password_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Validation_Helper.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResetPasswordCubit>().setEmail(widget.email);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordloading) {
          EasyLoading.show(status: 'Wait..');
        } else if (state is ResetPasswordSucsess) {
          EasyLoading.dismiss();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
              EasyLoading.showSuccess('Password was changed successfully');
            }
          });
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Reset Password', style: AppStyles.textstyle28),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Set the new password for your account so you can log in and access all the features.',
                    style: AppStyles.textstyle14.copyWith(
                      color: Color(0xff7A7A7B),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformfield(
                    controller: newPasswordController,
                    validator: ValidationHelper.validatePassword,
                    hint: 'New Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureNewPassword = !obscureNewPassword;
                        });
                      },
                      icon: Icon(
                        obscureNewPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    obscureText: obscureNewPassword,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformfield(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    hint: 'Re-enter Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    obscureText: obscureConfirmPassword,
                  ),
                  SizedBox(height: 30.h),

                  CustomButton(
                    textbutton: 'Update Password',
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          final cubit = context.read<ResetPasswordCubit>();
                          cubit.userResetPassword(
                            NewPassword: newPasswordController.text.trim(),
                          );
                        }
                      } catch (e) {
                        EasyLoading.showError(
                          'Something went wrong. Please try again.',
                        );
                        print('Error in reset password: $e');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
