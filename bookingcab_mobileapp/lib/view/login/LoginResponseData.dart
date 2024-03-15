class LoginResponseData {
  String? status;
  String? error = "";
  UserData? data;

  LoginResponseData({this.status, this.data, this.error});

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      status: json['status'] as String? ?? '',
      error: json['error'] as String? ?? '',
      data: json['data'] != null
          ? UserData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UserData {
  final int userId;
  final String userGrade;
  final int acceptFare;
  final int userTypeId;
  final int companyId;
  final String firstName;
  final String lastName;
  final String email;
  final String mobilePrefix;
  final String mobile;
  final int isActive;
  final int signupStatus;
  final int loginOtpStatus;
  final int countryId;
  final String token;

  UserData({
    required this.userId,
    required this.userGrade,
    required this.acceptFare,
    required this.userTypeId,
    required this.companyId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobilePrefix,
    required this.mobile,
    required this.isActive,
    required this.signupStatus,
    required this.loginOtpStatus,
    required this.countryId,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['user_id'] as int? ?? 0,
      userGrade: json['user_grade'] as String? ?? '',
      acceptFare: json['accept_fare'] as int? ?? 0,
      userTypeId: json['user_type_id'] as int? ?? 0,
      companyId: json['company_id'] as int? ?? 0,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobilePrefix: json['mobile_prefix'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      isActive: json['is_active'] as int? ?? 0,
      signupStatus: json['signup_status'] as int? ?? 0,
      loginOtpStatus: json['login_otp_status'] as int? ?? 0,
      countryId: json['country_id'] as int? ?? 0,
      token: json['token'] as String? ?? '',
    );
  }
}
