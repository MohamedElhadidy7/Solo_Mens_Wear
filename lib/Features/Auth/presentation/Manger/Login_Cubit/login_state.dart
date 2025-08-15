part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class Loginloading extends LoginState {}

final class Loginsucsess extends LoginState {
  final String message;
  Loginsucsess(this.message);
}

final class LoginFaliure extends LoginState {
  final String errorMessage;
  LoginFaliure(this.errorMessage);
}
