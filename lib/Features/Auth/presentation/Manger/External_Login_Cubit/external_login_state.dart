part of 'external_login_cubit.dart';

@immutable
sealed class ExternalLoginState {}

final class ExternalLoginInitial extends ExternalLoginState {}

final class ExternalLoginLoading extends ExternalLoginState {}

final class ExternalLoginSucsess extends ExternalLoginState {
  final String message;
  ExternalLoginSucsess(this.message);
}

final class ExternalLoginFaliure extends ExternalLoginState {
  ExternalLoginFaliure({required this.errorMessage});

  final String errorMessage;
}
