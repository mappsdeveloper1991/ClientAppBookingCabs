class ForgotPasswordGetOTPResponseData {
   String? status = "";
   String? msg = "";
   UserData? data = null;

  ForgotPasswordGetOTPResponseData({required this.status, this.msg,  this.data});

  factory ForgotPasswordGetOTPResponseData.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordGetOTPResponseData(
      status: json['status'] as String? ?? '',
      msg: json['msg'] as String? ?? '',
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
   int? userId;
   String? userGrade;
   int? acceptFare;
   int? userTypeId;
   int? companyId;
   String? firstName;
   String? lastName;
   String? email;
   String? mobilePrefix;
   String? mobile;
   int? isActive;
   int? signupStatus;
   int? loginOtpStatus;
   int? countryId;

  UserData({
    this.userId,
    this.userGrade,
    this.acceptFare,
    this.userTypeId,
    this.companyId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobilePrefix,
    this.mobile,
    this.isActive,
    this.signupStatus,
    this.loginOtpStatus,
    this.countryId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['user_id'] as int? ?? 0,
      userGrade: json['user_grade'] as String? ?? '',
      acceptFare: json['accept_fare'] as int?  ?? 0,
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
    );
  }
}