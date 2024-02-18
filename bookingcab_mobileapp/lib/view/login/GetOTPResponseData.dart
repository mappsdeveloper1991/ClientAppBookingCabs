class GetOTPResponseData {
   String? status = "";
   List<UserData>? data;
   String? msg = "";

  GetOTPResponseData({required this.status, required this.data, required this.msg});

  factory GetOTPResponseData.fromJson(Map<String, dynamic> json) {

var dataList = json['data'] as List?;
    List<UserData>? userDataList;
    if (dataList != null) {
      userDataList = dataList.map((data) => UserData.fromJson(data)).toList();
    }

    return GetOTPResponseData(
      status: json['status'] as String? ?? '',
      //data: userDataList,
      data: json['data'] != null ? userDataList : null,
      msg: json['msg'] as String? ?? '',
    );
  }
}

class UserData {
   int userId;
   String userGrade;
   int acceptFare;
   int userTypeId;
   int companyId;
   String firstName;
   String lastName;
   String email;
   String mobilePrefix;
   String mobile;
   int isActive;
   int signupStatus;
   int loginOtpStatus;
   int countryId;

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
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['user_id'] as int,
      userGrade: json['user_grade'] as String,
      acceptFare: json['accept_fare'] as int,
      userTypeId: json['user_type_id'] as int,
      companyId: json['company_id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      mobilePrefix: json['mobile_prefix'] as String,
      mobile: json['mobile'] as String,
      isActive: json['is_active'] as int,
      signupStatus: json['signup_status'] as int,
      loginOtpStatus: json['login_otp_status'] as int,
      countryId: json['country_id'] as int,
    );
  }
}