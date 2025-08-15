import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Router.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'package:solo/Features/Auth/presentation/Manger/Login_Cubit/login_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/ForgetPasswprdSheet.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Validation_Helper.dart';

class Loginsection extends StatefulWidget {
  const Loginsection({super.key});

  @override
  State<Loginsection> createState() => _LoginsectionState();
}

class _LoginsectionState extends State<Loginsection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Loginloading) {
          EasyLoading.show(status: 'Logging in...');
        } else if (state is Loginsucsess) {
          EasyLoading.showSuccess('Success!');
          Future.delayed(Duration(milliseconds: 600), () {
            GoRouter.of(context).go('/Home');
          });
        } else if (state is LoginFaliure) {
          EasyLoading.showError(state.errorMessage);
          print(state.errorMessage);
        }
      },

      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextformfield(
                validator: ValidationHelper.validateEmail,
                hint: 'Example11@gmail.com',
                suffixIcon: Icon(Icons.email),
                controller: emailcontroller,
              ),
              const SizedBox(height: 20),
              CustomTextformfield(
                validator: ValidationHelper.validatePassword,
                hint: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                obscureText: obscureText,
                controller: passwordcontroller,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const ForgetPasswordSheet(),
                    );
                  },
                  child: Text(
                    'Forget Password?',
                    style: AppStyles.textstyle14.copyWith(color: primarycolor),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              CustomButton(
                textbutton: 'Log in',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Email = emailcontroller.text;
                    final Password = passwordcontroller.text;
                    BlocProvider.of<LoginCubit>(
                      context,
                    ).LoginUser(Email: Email, Password: Password);
                  }
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: AppStyles.textstyle14),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      GoRouter.of(context).push('/Register');
                    },
                    child: Text(
                      'Join Us',
                      style: AppStyles.textstyle14.copyWith(
                        color: primarycolor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
