import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo/Constants.dart';
import 'package:solo/Core/Utils/App_Styles.dart';
import 'package:solo/Core/Widgets/Custom_Button.dart';
import 'package:solo/Core/Widgets/Custom_TextFormField.dart';
import 'package:solo/Features/Auth/presentation/Manger/Register_Cubit/register_cubit.dart';
import 'package:solo/Features/Auth/presentation/view/widgets/Validation_Helper.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is Registerloading) {
          Center(child: CircularProgressIndicator());
        } else if (state is Registersucsess) {
          AwesomeDialog(
            titleTextStyle: AppStyles.textstyle20,
            descTextStyle: AppStyles.textstyle14.copyWith(color: Colors.grey),
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Registered Sucsessfully',
            desc: 'Please check your Email to verify your account!',
            btnOkOnPress: () {
              GoRouter.of(context).pop();
            },
          ).show();
        } else if (state is RegisterFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextformfield(
                hint: 'Name',
                controller: nameController,
                validator: ValidationHelper.validateName,
              ),
              const SizedBox(height: 20),
              CustomTextformfield(
                hint: 'Phone',
                keyboardType: TextInputType.number,
                controller: phoneController,
                validator: ValidationHelper.validatePhone,
              ),
              const SizedBox(height: 20),
              CustomTextformfield(
                hint: 'Email',
                controller: emailController,
                validator: ValidationHelper.validateEmail,
              ),
              const SizedBox(height: 20),
              CustomTextformfield(
                hint: 'Password',
                controller: passwordController,
                validator: ValidationHelper.validatePassword,
                obscureText: obscureText,
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
              ),
              const SizedBox(height: 14),
              CustomButton(
                textbutton: 'Sign Up',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = nameController.text;
                    final phone = phoneController.text;
                    final email = emailController.text;
                    final password = passwordController.text;
                    BlocProvider.of<RegisterCubit>(context).userRegister(
                      name: name,
                      phoneNumber: phone,
                      email: email,
                      password: password,
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?", style: AppStyles.textstyle14),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Log In',
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

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
