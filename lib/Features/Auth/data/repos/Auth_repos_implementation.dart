import 'package:dio/dio.dart';
import 'package:solo/Core/Utils/Api_Service.dart';
import 'package:solo/Features/Auth/data/Models/Forget_Password_Model/ForgetPassword_Model.dart';
import 'package:solo/Features/Auth/data/Models/Login_Models/LoginModel.dart';
import 'package:solo/Features/Auth/data/Models/OTP_Model/OTP_Model.dart';
import 'package:solo/Features/Auth/data/Models/Register_Model/Register_Model.dart';
import 'package:solo/Features/Auth/data/Models/Reset_Password_Model/Reset_Password_Model.dart';

import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';

class AuthReposImpl implements AuthRepos {
  final Apiservice apiservice;

  AuthReposImpl({required this.apiservice});

  @override
  Future<RegisterModel> RegisterService({
    required String PhoneNumber,
    required String Name,
    required String Email,
    required String Password,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/Account/Register',
        data: {
          "Name": Name,
          "PhoneNumber": PhoneNumber,
          "Email": Email,
          "Password": Password,
        },
      );
      final registerModel = RegisterModel.fromJson(response);
      return registerModel;
    } on DioException catch (e) {
      final serverMessage = e.response?.data?['message'] ?? 'حدث خطأ';
      throw Exception(serverMessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<LoginModel> LoginService({
    required String Email,
    required String Password,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/Account/LogIn',
        data: {'Email': Email, 'Password': Password},
      );
      final loginModel = LoginModel.fromJson(response);
      return loginModel;
    } on DioException catch (e) {
      final serverMessage = e.response?.data?['message'] ?? 'حدث خطأ';
      throw Exception(serverMessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<ForgetpasswordModel> ForgetPasswordService({
    required String email,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/Account/ForgetPassword',
        data: {'email': email},
      );
      final forgetpasswordmodel = ForgetpasswordModel.fromjson(response);
      return forgetpasswordmodel;
    } on DioException catch (e) {
      final serverMessage = e.response?.data?['message'] ?? 'حدث خطأ';
      throw Exception(serverMessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<OTPModel> VerifyOtpservice({
    required String Email,
    required String Otp,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/Account/VerifyOtp',
        data: {'Email': Email, 'Otp': Otp},
      );
      final otpmodel = OTPModel.fromjson(response);
      return otpmodel;
    } on DioException catch (e) {
      final servermessage = e.response?.data?['message'] ?? 'حدث خطأ';
      throw Exception(servermessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<ResetPasswordModel> ResetPasswordService({
    required String Email,
    required String NewPassword,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/Account/ResetPassword',
        data: {'Email': Email, 'NewPassword': NewPassword},
      );

      final resetPasswordmodel = ResetPasswordModel.fromjson(response);
      return resetPasswordmodel;
    } on DioException catch (e) {
      final servermessage =
          e.response?.data?['message']?.toString() ?? 'حدث خطأ';
      throw Exception(servermessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<LoginModel> LoginWithGoogleService({
    required String providerKey,
    required String email,
    required String name,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/SocialAuth/ExternalLogin',
        data: {
          'provider': 'google',
          'providerKey': providerKey,
          'email': email,
          'name': name,
        },
        asJson: true,
      );

      return LoginModel.fromJson(response);
    } on DioException catch (e) {
      final serverMessage =
          e.response?.data?['message'].toString() ?? 'حدث خطأ';
      throw Exception(serverMessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }

  @override
  Future<LoginModel> LoginWithFacebookService({
    required String providerKey,
    required String email,
    required String name,
  }) async {
    try {
      final response = await apiservice.post(
        endpoint: 'api/SocialAuth/ExternalLogin',
        data: {
          'provider': 'facebook',
          'providerKey': providerKey,
          'email': email,
          'name': name,
        },
        asJson: true,
      );

      return LoginModel.fromJson(response);
    } on DioException catch (e) {
      final serverMessage =
          e.response?.data?['message'].toString() ?? 'حدث خطأ';
      throw Exception(serverMessage);
    } catch (e) {
      throw Exception('حدث خطأ غير متوقع');
    }
  }
}
