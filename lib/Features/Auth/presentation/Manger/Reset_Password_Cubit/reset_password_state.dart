part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordloading extends ResetPasswordState {}

final class ResetPasswordSucsess extends ResetPasswordState {
  ResetPasswordSucsess({required this.message});

  final String message;
}

final class ResetPasswordFaliure extends ResetPasswordState {
  ResetPasswordFaliure({required this.errmessage});

  final String errmessage;
}
