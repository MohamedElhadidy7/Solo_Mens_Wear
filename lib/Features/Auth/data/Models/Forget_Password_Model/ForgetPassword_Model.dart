class ForgetpasswordModel {
  final String status;
  final String message;
  final bool isSuccess;
  ForgetpasswordModel({
    required this.status,
    required this.message,
    required this.isSuccess,
  });

  factory ForgetpasswordModel.fromjson(Map<String, dynamic> json) {
    return ForgetpasswordModel(
      status: json['status'],
      message: json['message'] ?? '',
      isSuccess: json['isSuccess'],
    );
  }
  Map<String, dynamic> toJson() {
    return {"status": status, "message": message, "isSuccess": isSuccess};
  }
}
