class ChangesPasswordResponseData {
   String? status;
   String? message;
   String? errorCode;

  ChangesPasswordResponseData({
    required this.status,
    required this.message,
    required this.errorCode,
  });

  factory ChangesPasswordResponseData.fromJson(Map<String, dynamic> json) {
    return ChangesPasswordResponseData(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      errorCode: json['ErrorCode'] as String? ?? '',
    );
  }
}
