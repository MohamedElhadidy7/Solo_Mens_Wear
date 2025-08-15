import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:solo/Features/Auth/data/repos/Auth_repos.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepos authRepos;

  RegisterCubit(this.authRepos) : super(RegisterInitial());

  Future<void> userRegister({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    emit(Registerloading());

    try {
      final registerModel = await authRepos.RegisterService(
        Name: name,
        PhoneNumber: phoneNumber,
        Email: email,
        Password: password,
      );

      emit(Registersucsess(registerModel.message));
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }

      emit(RegisterFaliure(errorMessage));
    }
  }
}
