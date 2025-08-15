import 'package:dartz/dartz.dart';
import 'package:solo/Features/Auth/data/Models/Login_Models/LoginModel.dart';

import 'package:solo/Features/Auth/data/Models/Register_Model/Register_Model.dart';

abstract class AuthRepos {
  Future<RegisterModel> RegisterService({
    required String Name,
    required String PhoneNumber,
    required String Email,
    required String Password,
  });

  Future<LoginModel> LoginService({
    required String Email,
    required String Password,
  });
}
