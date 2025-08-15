part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class Registerloading extends RegisterState {}

final class Registersucsess extends RegisterState {
  final String message;
  Registersucsess(this.message);
}

final class RegisterFaliure extends RegisterState {
  final String errorMessage;
  RegisterFaliure(this.errorMessage);
}
