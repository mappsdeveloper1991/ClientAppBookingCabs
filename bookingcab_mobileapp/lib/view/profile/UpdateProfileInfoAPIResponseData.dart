class UpdateProfileInfoAPIResponseData {
   String status;
   String message;

  UpdateProfileInfoAPIResponseData({
    required this.status,
    required this.message,
  });

  factory UpdateProfileInfoAPIResponseData.fromJson(Map<String, dynamic> json) {
    return UpdateProfileInfoAPIResponseData(
      status: json['status']  as String? ?? '',
      message: json['data']['message'] as String? ?? '',
    );
  }
}
