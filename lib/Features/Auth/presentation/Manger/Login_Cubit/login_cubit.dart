import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solo/Core/Utils/Secured_data.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepos authRepos;
  final TokenStorageService _tokenStorage = TokenStorageService();
  LoginCubit(this.authRepos) : super(LoginInitial());
  Future<void> LoginUser({
    required String Email,
    required String Password,
  }) async {
    emit(Loginloading());
    try {
      final LoginModel = await authRepos.LoginService(
        Email: Email,
        Password: Password,
      );
      final accessToken = LoginModel.response['accessToken']['Token'];
      final refreshToken = LoginModel.response['refreshToken']['token'];

      if (accessToken != null && refreshToken != null) {
        await _tokenStorage.saveTokens(accessToken, refreshToken);
      }
      emit(Loginsucsess(LoginModel.message));
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }

      emit(LoginFaliure(errorMessage));
    }
  }
}
