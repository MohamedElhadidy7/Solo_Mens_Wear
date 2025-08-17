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
    if (_email == null) {
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
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }

      emit(ResetPasswordFaliure(errmessage: errorMessage));
    }
  }

  Future<void> userVerifyOtp({required String otp}) async {
    if (_email == null) {
      emit(
        ResetPasswordFaliure(errmessage: "Email not found, please try again"),
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
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }

      emit(ResetPasswordFaliure(errmessage: errorMessage));
    }
  }
}
