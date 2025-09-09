import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solo/Core/Utils/Secured_data.dart';

import 'package:solo/Features/Auth/data/repos/Auth_repos_implementation.dart';

part 'external_login_state.dart';

class ExternalLoginCubit extends Cubit<ExternalLoginState> {
  final AuthReposImpl authRepos;
  final TokenStorageService _tokenStorage = TokenStorageService();

  ExternalLoginCubit(this.authRepos) : super(ExternalLoginInitial());

  Future<void> loginWithGoogle({
    required String providerKey,
    required String email,
    required String name,
  }) async {
    emit(ExternalLoginLoading());
    try {
      final loginModel = await authRepos.LoginWithGoogleService(
        providerKey: providerKey,
        email: email,
        name: name,
      );

      if (loginModel.isSuccess) {
        final accessToken = loginModel.response['accessToken']?['token'];
        final refreshToken = loginModel.response['refreshToken']?['token'];

        if (accessToken != null && refreshToken != null) {
          await _tokenStorage.saveTokens(accessToken, refreshToken);
          emit(ExternalLoginSucsess(loginModel.message));
        } else {
          emit(ExternalLoginFaliure(errorMessage: "فشلت عمليه التسجيل"));
        }
      } else {
        emit(ExternalLoginFaliure(errorMessage: loginModel.message));
      }
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      emit(ExternalLoginFaliure(errorMessage: errorMessage));
    }
  }

  Future<void> loginWithFacebook({
    required String providerKey,
    required String email,
    required String name,
  }) async {
    emit(ExternalLoginLoading());

    try {
      final loginModel = await authRepos.LoginWithFacebookService(
        providerKey: providerKey,
        email: email,
        name: name,
      );

      if (loginModel.isSuccess) {
        final accessToken = loginModel.response['accessToken']?['token'];
        final refreshToken = loginModel.response['refreshToken']?['token'];

        if (accessToken != null && refreshToken != null) {
          await _tokenStorage.saveTokens(accessToken, refreshToken);

          emit(ExternalLoginSucsess(loginModel.message));
        } else {
          emit(
            ExternalLoginFaliure(
              errorMessage: "فشلت عمليه التسجيل - لا توجد رموز مميزة",
            ),
          );
        }
      } else {
        emit(ExternalLoginFaliure(errorMessage: loginModel.message));
      }
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      emit(ExternalLoginFaliure(errorMessage: errorMessage));
    }
  }

  // Reset state method
  void resetState() {
    emit(ExternalLoginInitial());
  }
}
