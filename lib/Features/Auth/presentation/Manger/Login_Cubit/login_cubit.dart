import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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

    print('=== LOGIN DEBUG INFO ===');
    print('Email: "$Email"');
    print('Password length: ${Password.length}');
    print('========================');

    try {
      final loginmodel = await authRepos.LoginService(
        Email: Email.trim(),
        Password: Password,
      );

      final accessToken = loginmodel.response['accessToken']?['token'];
      final refreshToken = loginmodel.response['refreshToken']?['token'];

      if (accessToken != null && refreshToken != null) {
        await _tokenStorage.saveTokens(accessToken, refreshToken);
        emit(Loginsucsess(loginmodel.message));
      } else {
        emit(LoginFaliure("فشل في الحصول على رموز المصادقة"));
      }

    } on DioException catch (e) {
      print('=== DIO ERROR ===');
      print('Status Code: ${e.response?.statusCode}');
      print('Response Data: ${e.response?.data}');
      print('================');

      String errorMessage = _handleDioError(e);
      emit(LoginFaliure(errorMessage));

    } on Exception catch (e) {
      print('=== EXCEPTION ERROR ===');
      print('Exception: $e');
      print('=====================');

      String errorMessage = _handleGeneralException(e);
      emit(LoginFaliure(errorMessage));

    } catch (e) {
      print('=== UNEXPECTED ERROR ===');
      print('Error: $e');
      print('Error Type: ${e.runtimeType}');
      print('========================');

      emit(LoginFaliure("حدث خطأ غير متوقع"));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 401:
          return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
        case 422:
          return 'البيانات المدخلة غير صالحة';
        default:
          return 'حدث خطأ في الخادم';
      }
    } else {
      return 'فشل في الاتصال بالخادم';
    }
  }

  String _handleGeneralException(Exception e) {
    final errorString = e.toString().toLowerCase();

    if (errorString.contains('invalid credentials') ||
        errorString.contains('invalid password') ||
        errorString.contains('invalid email')) {
      return 'Email or Password is Wrong';
    } else if (errorString.contains('user not found') ||
        errorString.contains('account not found')) {
      return 'الحساب غير موجود';
    } else if (errorString.contains('account disabled') ||
        errorString.contains('account suspended')) {
      return 'الحساب معطل أو مُعلق';
    } else if (errorString.contains('network') ||
        errorString.contains('connection')) {
      return 'مشكلة في الاتصال بالإنترنت';
    } else if (errorString.contains('timeout')) {
      return 'انتهت مهلة الاتصال';
    } else {
      return 'تحقق من بيانات تسجيل الدخول';
    }
  }
}