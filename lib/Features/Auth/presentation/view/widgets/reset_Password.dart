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
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                style: AppStyles.textstyle14.copyWith(color: Color(0xff7A7A7B)),
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

              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordloading) {
                    EasyLoading.show(status: 'Updating password...');
                  } else if (state is ResetPasswordSucsess) {
                    EasyLoading.showSuccess('Password updated successfully!');
                    Future.delayed(Duration(milliseconds: 600), () {
                      Navigator.pop(context);
                      GoRouter.of(context).go('/Login');
                    });
                  } else if (state is ResetPasswordFaliure) {
                    EasyLoading.showError(state.errmessage);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    textbutton: 'Update Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // هنا تقدر تضيف الـ method بتاعة reset password في الـ cubit
                        // context.read<ResetPasswordCubit>().resetPassword(newPasswordController.text);
                        print('Password: ${newPasswordController.text}');
                        print('Confirm: ${confirmPasswordController.text}');
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
