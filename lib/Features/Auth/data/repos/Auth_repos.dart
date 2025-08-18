import 'package:dartz/dartz.dart';
import 'package:solo/Features/Auth/data/Models/Forget_Password_Model/ForgetPassword_Model.dart';
import 'package:solo/Features/Auth/data/Models/Login_Models/LoginModel.dart';
import 'package:solo/Features/Auth/data/Models/OTP_Model/OTP_Model.dart';

import 'package:solo/Features/Auth/data/Models/Register_Model/Register_Model.dart';
import 'package:solo/Features/Auth/data/Models/Reset_Password_Model/Reset_Password_Model.dart';

abstract class AuthRepos {
  Future<RegisterModel> RegisterService({
    required String Name,
    required String PhoneNumber,
    required String Email,
    required String Password,
  });

  Future<LoginModel> LoginService({
    required String Email,
    required String Password,
  });

  Future<ForgetpasswordModel> ForgetPasswordService({required String email});
  Future<OTPModel> VerifyOtpservice({
    required String Email,
    required String Otp,
  });

  Future<ResetPasswordModel> ResetPasswordService({
    required String Email,
    required String NewPassword,
  });
}
