import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solo/Features/Auth/data/Models/Forget_Password_Model/ForgetPassword_Model.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepos) : super(ResetPasswordInitial());

  final AuthRepos authRepos;

  String? _email;
  String? get email => _email;

  void setEmail(String email) {
    _email = email;
  }

  Future<void> userForgetPassword() async {
    if (_email == null || _email!.isEmpty) {
      emit(ResetPasswordFaliure(errmessage: "Email is required"));
      return;
    }

    emit(ResetPasswordloading());
    try {
      final forgetpasswordmodel = await authRepos.ForgetPasswordService(
        email: _email!,
      );
      emit(ResetPasswordSucsess(message: forgetpasswordmodel.message));
    } catch (e) {
      emit(
        ResetPasswordFaliure(
          errmessage: "Failed to send verification code. Please try again.",
        ),
      );
    }
  }

  Future<void> userVerifyOtp({required String otp}) async {
    if (_email == null || _email!.isEmpty) {
      emit(
        ResetPasswordFaliure(errmessage: "Email not found, please try again"),
      );
      return;
    }

    if (otp.isEmpty || otp.length != 4) {
      emit(
        ResetPasswordFaliure(errmessage: "Please enter a valid 4-digit code"),
      );
      return;
    }

    emit(ResetPasswordloading());
    try {
      final otpmodel = await authRepos.VerifyOtpservice(
        Email: _email!,
        Otp: otp,
      );
      emit(ResetPasswordSucsess(message: otpmodel.message));
    } catch (e) {
      emit(
        ResetPasswordFaliure(
          errmessage: "Invalid code. Please check and try again.",
        ),
      );
    }
  }

  Future<void> userResetPassword({required String NewPassword}) async {
    if (_email == null || _email!.isEmpty) {
      emit(
        ResetPasswordFaliure(errmessage: "Email not found, please try again"),
      );
      return;
    }

    if (NewPassword.isEmpty || NewPassword.length < 6) {
      emit(
        ResetPasswordFaliure(
          errmessage: "Password must be at least 6 characters",
        ),
      );
      return;
    }

    emit(ResetPasswordloading());
    try {
      final resetpasswordmodel = await authRepos.ResetPasswordService(
        Email: _email!,
        NewPassword: NewPassword,
      );

      emit(ResetPasswordSucsess(message: resetpasswordmodel.message));
    } catch (e) {
      String errorMessage = "Failed to reset password. Please try again.";
      if (e.toString().contains('404')) {
        errorMessage = "User not found. Please check your email.";
      } else if (e.toString().contains('400')) {
        errorMessage = "Invalid request. Please try again.";
      } else if (e.toString().contains('500')) {
        errorMessage = "Server error. Please try again later.";
      } else if (e.toString().contains('network') ||
          e.toString().contains('connection')) {
        errorMessage = "Network error. Please check your connection.";
      }

      emit(ResetPasswordFaliure(errmessage: errorMessage));
    }
  }
}
