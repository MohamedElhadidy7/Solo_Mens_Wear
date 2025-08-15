class LoginModel {
  final bool isSuccess;
  final String message;
  final Map<String, dynamic> response;
  LoginModel({
    required this.isSuccess,
    required this.message,
    required this.response,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      isSuccess: json["isSuccess"],
      message: json["message"],
      response: json["response"] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {"isSuccess": isSuccess, "message": message, "response": response};
  }
}
