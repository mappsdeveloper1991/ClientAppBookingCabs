 class MyAccountResponseData {
  String? status = "";
   String? message = "";
   UserProfileData? data;

  MyAccountResponseData({required this.status, required this.data, required this.message});

  factory MyAccountResponseData.fromJson(Map<String, dynamic> json) {
    return MyAccountResponseData(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: json['data'] != null ? UserProfileData.fromJson(json['data'] as Map<String, dynamic>) : null 
    );
  }
 }

  class UserProfileData {
   int? userId = 0;
   String? userGrade = '';
   int? acceptFare = 0;
   int? userTypeId = 0;
   String? username= '';
   String? userTypeName= '';
   int? companyId = 0;
   String? companyName= '';
   String? companyAddress= '';
   String? companyMobile= '';
   String? companySetupGstNo= '';
   

   String? userCompanyName= '';
   String? contactPersonName= '';
   String? websiteUrl= '';
   String? userCompanyAddress= '';
   String? userCompanyPincode= '';
   String? userCompanyEmail= '';
   String? userCompanyAltEmail= '';
   String? userCompanyPrefixMobile= '';
   String? userCompanyMobileNo= '';
   String? userCompanyLandlinePrefix= '';
   String? userCompanyLandlineNo= '';
   String? userGstNo= '';
   String? companyPancardNo= '';
   
   String? name= '';
   String? symbol= '';
   int? parentId = 0;
   String? firstName= '';
   String? lastName= '';
   String? email= '';
   String? mobilePrefix= '';
   String? mobile= '';
   String? gender= '';

   /*
   String? roleId= '';
   String? roleName= '';
   String? departmentName= '';
   */


   int? walletAmount = 0;
   String? gcmId = '';
   int? loginStatus = 0;
   //String? logint? '';
   //String? logoutTime;
   int? emailVerified = 0;
   int? phoneVerified= 0;
   String? referralKey= '';
   //String? referBy= '';
   int? isActive = 0;
   int? loginOtpStatus= 0;
   int? newsletterSubscription  =0 ;
   int? mobilePromotion = 0;
   String? alternateMobile= '';
   String? alternateEmail= '';
   String? dob= '';
   String? fatherName= '';
   String? address= '';
   //String? address2= '';
   int? pincode = 0;
   int? countryId = 0;
   int? stateId= 0;
   int? cityId= 0;
   int? kycType= 0;
   String? kyc= '';
   String? landlineNumber= '';
   String? countryName= '';
   String? stateName= '';
   String? cityName= '';
   

   String? vehicleModel= '';
   String? ignitionTypeId= '';
   String? ignitionType= '';
   String? vehicleNo= '';
   String? vehicleName= '';
   String? vehicleType= '';
   String? vehicleImage= '';
   String? profileImg= '';
   String? image= '';
   String? companyLogo= '';
   String? relationManagerId= '';
   String? staffName= '';
   String? staffEmail= '';
   String? staffMobile= '';
   
   int? creditBalance= 0;

  UserProfileData({
     this.userId,
     this.userGrade,
     this.acceptFare,
     this.userTypeId,
     this.username,
     this.userTypeName,
     this.companyId,
     this.companyName,
     this.companyAddress,
     this.companyMobile,
     this.companySetupGstNo,
   
    this.userCompanyName,
    this.contactPersonName,
    this.websiteUrl,
    this.userCompanyAddress,
    this.userCompanyPincode,
    this.userCompanyEmail,
    this.userCompanyAltEmail,
    this.userCompanyPrefixMobile,
    this.userCompanyMobileNo,
    this.userCompanyLandlinePrefix,
    this.userCompanyLandlineNo,
    this.userGstNo,
    this.companyPancardNo,
    
    this.name,
    this.symbol,

     this.parentId,
     this.firstName,
     this.lastName,
     this.email,
     this.mobilePrefix,
     this.mobile,
     this.gender,

     /*
    this.roleId,
    this.roleName,
    this.departmentName,
*/

     this.walletAmount,
    this.gcmId,
     this.loginStatus,
    // this.logint?ime,
    //this.logoutTime,
     this.emailVerified,
     this.phoneVerified,
     this.referralKey,
    //this.referBy,
     this.isActive,
     this.loginOtpStatus,
     this.newsletterSubscription,
     this.mobilePromotion,
     this.alternateMobile,
    this.alternateEmail,
     this.dob,
   this.fatherName,
     this.address,
    //this.address2,
     this.pincode,
     this.countryId,
    
    this.stateId,
    this.cityId,
    this.kycType,
    this.kyc,
    this.landlineNumber,
    this.countryName,
    this.stateName,
    this.cityName,
    
    this.vehicleModel,
    this.ignitionTypeId,
    this.ignitionType,
    this.vehicleNo,
    this.vehicleName,
    this.vehicleType,
    this.vehicleImage,
    this.profileImg,
    this.image,
    this.companyLogo,
    this.relationManagerId,
    this.staffName,
    this.staffEmail,
    this.staffMobile,

     this.creditBalance,
  });

  factory UserProfileData.fromJson(Map<String?, dynamic> json) {
    return UserProfileData(
      userId: json['user_id'] as int? ?? 0,
      userGrade: json['user_grade']  as String? ?? '',
      acceptFare: json['accept_fare'] as int? ?? 0,
      userTypeId: json['user_type_id'] as int? ?? 0,
      username: json['username']  as String? ?? '',
      userTypeName: json['user_type_name'] as String? ?? '',
      companyId: json['company_id'] as int? ?? 0,
      companyName: json['company_name'] as String? ?? '',
      companyAddress: json['company_address'] as String? ?? '',
      companyMobile: json['company_mobile'] as String? ?? '',
      companySetupGstNo: json['companysetup_gst_no'] as String? ?? '',
      

      userCompanyName: json['user_company_name'] as String? ?? '',
      contactPersonName: json['contact_person_name'] as String? ?? '',
      websiteUrl: json['website_url'] as String? ?? '',
      userCompanyAddress: json['user_company_address'] as String? ?? '',
      userCompanyPincode: json['user_company_pincode'] as String? ?? '',
      userCompanyEmail: json['user_company_email'] as String? ?? '',
      userCompanyAltEmail: json['user_company_alt_email'] as String? ?? '',
      userCompanyPrefixMobile: json['user_company_prefix_mobile'] as String? ?? '',
      userCompanyMobileNo: json['user_company_mobile_no'] as String? ?? '',
      userCompanyLandlinePrefix: json['user_company_landline_prefix'] as String? ?? '',
      userCompanyLandlineNo: json['user_company_landline_no'] as String? ?? '',
      userGstNo: json['user_gst_no'] as String? ?? '',
      companyPancardNo: json['company_pancard_no'] as String? ?? '',
      
      

      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      parentId: json['parent_id'] as int? ?? 0,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobilePrefix: json['mobile_prefix'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      gender: json['gender'] as String? ?? '',


     /*
      roleId: json['role_id'] as String? ?? '',
      roleName: json['role_name'] as String? ?? '',
      departmentName: json['department_name'] as String? ?? '',
      */
      
      walletAmount: json['wallet_amount'] as int? ?? 0,
     // gcmId: json['gcm_id'] as String? ?? '',
      loginStatus: json['login_status'] as int? ?? 0,
      //logint?ime: json['login_time'] as int? ?? 0,
      //logoutTime: json['logout_time'] as int? ?? 0,
      emailVerified: json['email_verified'] as int? ?? 0,
      phoneVerified: json['phone_verified'] as int? ?? 0,
      referralKey: json['referral_key'] as String? ?? '',
      //referBy: json['refer_by'] as String? ?? '',
      isActive: json['is_active'] as int? ?? 0,
      loginOtpStatus: json['login_otp_status'] as int? ?? 0,
      newsletterSubscription: json['newsletter_subscription'] as int? ?? 0,
      mobilePromotion: json['mobile_promotion'] as int? ?? 0,
      alternateMobile: json['alternate_mobile'] as String? ?? '',
      alternateEmail: json['alternate_email'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      fatherName: json['father_name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      //address2: json['address2'] as String? ?? '',


      pincode: json['pincode'] as int? ?? 0,
      countryId: json['country_id'] as int? ?? 0,
      stateId: json['state_id']as int? ?? 0,
      cityId: json['city_id'] as int? ?? 0,
      kycType: json['kyc_type'] as int? ?? 0,
      kyc: json['kyc'] as String? ?? '',
      landlineNumber: json['landline_number'] as String? ?? '',
      countryName: json['country_name'] as String? ?? '',
      stateName: json['state_name'] as String? ?? '',
      cityName: json['city_name'] as String? ?? '',

      
      
      vehicleModel: json['vehicle_model'] as String? ?? '',
      ignitionTypeId: json['ignition_type_id'] as String? ?? '',
      ignitionType: json['ignition_type'] as String? ?? '',
      vehicleNo: json['vehicle_no'] as String? ?? '',
      vehicleName: json['vehicle_name'] as String? ?? '',
      vehicleType: json['vehicle_type'] as String? ?? '',
      vehicleImage: json['vehicle_image'] as String? ?? '',
      profileImg: json['profile_img'] as String? ?? '',
      image: json['image'] as String? ?? '',
      companyLogo: json['company_logo'] as String? ?? '',
      relationManagerId: json['relation_manager_id'] as String? ?? '',
      staffName: json['staff_name'] as String? ?? '',
      staffEmail: json['staff_email'] as String? ?? '',
      staffMobile: json['staff_mobile'] as String? ?? '',

      creditBalance: json['credit_balance'] as int? ?? 0
    );
  }
}
