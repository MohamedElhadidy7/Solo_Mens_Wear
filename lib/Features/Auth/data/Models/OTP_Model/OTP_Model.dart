class OTPModel {
  final String message;
  final String email;
  OTPModel({required this.message, required this.email});

  factory OTPModel.fromjson(Map<String, dynamic> json) {
    return OTPModel(message: json['message'], email: json['email']);
  }

  Map<String, dynamic> tojson() {
    return {'message': message, 'email': email};
  }
}
