class VerifyOTPResponseData {
  String? status = "";
  String? message = "";
  UserData? data;

  VerifyOTPResponseData(
      {required this.status, required this.data, required this.message});

  factory VerifyOTPResponseData.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponseData(
        status: json['status'] as String? ?? '',
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? UserData.fromJson(json['data'] as Map<String, dynamic>)
            : null);
  }
}

class UserData {
  final int id;
  final int UID;
  final String verificationCode;
  final int isUsed;

  UserData({
    required this.id,
    required this.UID,
    required this.verificationCode,
    required this.isUsed,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      UID: json['UID'] as int,
      verificationCode: json['Verification_code'] as String,
      isUsed: json['isUsed'] as int,
    );
  }
}
