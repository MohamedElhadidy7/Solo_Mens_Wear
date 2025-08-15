class RegisterModel {
  final bool isSuccess;
  final String message;
  final int statusCode;
  final Map<String, dynamic> response;

  RegisterModel({
    required this.isSuccess,
    required this.message,
    required this.statusCode,
    required this.response,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      isSuccess: json["isSuccess"],
      message: json["message"],
      statusCode: json["statusCode"],
      response: json["response"] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isSuccess": isSuccess,
      "message": message,
      "statusCode": statusCode,
      "response": response,
    };
  }
}
