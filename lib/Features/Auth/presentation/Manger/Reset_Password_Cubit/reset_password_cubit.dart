import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solo/Features/Auth/data/Models/Forget_Password_Model/ForgetPassword_Model.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepos) : super(ResetPasswordInitial());
  final AuthRepos authRepos;

  Future<void> UserForgetPassword({required String email}) async {
    emit(ResetPasswordloading());
    try {
      final forgetpasswordmodel = await authRepos.ForgetPasswordService(
        email: email,
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
}
