class BookingListAPIResponseData {
  String status;
  List<BookingDetails> bookingList;

  BookingListAPIResponseData({required this.status, required this.bookingList});

  factory BookingListAPIResponseData.fromJson(Map<String, dynamic> json) {
    return BookingListAPIResponseData(
      status: json['status'],
      bookingList: List<BookingDetails>.from(
          json['data'].map((x) => BookingDetails.fromJson(x))),
    );
  }
}

//https://api.bookingcabs.com:3001/api/v1/booking/bookingListSearch?access_token=340b26cb68ad51a74c6a1b2bdb70d00aaa5cf07848da4f0210c07aa3a161dc33
//https://api.bookingcabs.com:3001/api/v1/booking/bookingListSearch?access_token=340b26cb68ad51a74c6a1b2bdb70d00aaa5cf07848da4f0210c07aa3a161dc33

class BookingDetails {
  String bookingTime = '';

  String bookingDate = '';

  String pickupArea = '';

  String dropArea = '';

  String dropDate = '';

  String dropTime = '';

  /*
   int id;
   int baseVehicleId;
   String sacCode;
   String sacDescription;
  // String? itineraryId;
   int companyId;
   String domainName;
   int currencyId;
   String currency;
   String currencySymbol;
   int driverId;
   String ref;
   int statusC;
   int statusId;
   int userId;
   String firstName;
   String lastName;
   String userName;
   String email;
   String userMobile;
   String userNationality;
  // String? userAltMobile;
   String driverStatus;
   int clientId;
   String clientName;
   String clientMobile;
   String clientEmail;
   String? clientAltMobile;
   String driverName;
   String mobile;
   int dutyStatus;
   String companyName;
   String mobileNo;
   String landlineNo;
   String gstNo;
  // String? serviceTaxGst;
   String vehicleNo;
   String year;
   String color;
   String vehicleName;
   String packageMode;
   int bookingTypeId;
   String bookingType;
   String bookingTypeImage;
   String bookingTypeIcon;
   String chargeType;
   String vehicle;
   int noOfVehicles;
   DateTime bookingDate;
   String bookingTime;
   String deviceType;
   String status;
   int bookingEstimationId;
   int bookingId;
   String estimatedTime;
   int estimatedDistance;
   int estimatepriceBeforeDiscount;
   int discountPrice;
   int estimatedPrice;
   int bookingAmtPercentage;
   int estimatedPriceBeforeMarkup;
   int totalTaxPrice;
   int approxDistanceCharge;
   int approxAfterKm;
   int approxAfterHour;
   int approxHourCharge;
   int approxWaitingCharge;
   int approxWaitingMinute;
   int minimumCharge;
   String nightRateType;
   int nightRateValue;
   String nightRateBegins;
   String nightRateEnds;
   int nightChargePrice;
   String premiumsType;
   int premiumsValue;
   int premiumsPrice;
   String extras;
   int extraPrice;
   String peakTimeValue;
   int peakTimePrice;
   int cgstTax;
   int igstTax;
   int sgstTax;
  // DateTime createdDate;
  // DateTime updatedDate;
   int amount;
   String serviceCharge;
   String bookingCancellationRule;
   String serviceChargeCgstAmount;
   String serviceChargeIgstAmount;
   String serviceChargeSgstAmount;
   String serviceChargeCgst;
   String serviceChargeIgst;
   String serviceChargeSgst;
   String serviceChargeSacCodeId;
   String serviceChargeSacCode;
   String serviceChargeSacCodeDescription;
   String ordertime;
   String pickupArea;
   String departure;
   String dropArea;
   String dropAddress;
   int adults;
   String pickupCountry;
   String pickupState;
   String pickupCity;
   String pickupLatitude;
   String pickupLongitude;
   String pickupZone;
   DateTime dropDate;
   String dropTime;
   String dropLatitude;
   String dropLongitude;
   String localPkgName;
*/

  /*
  BookingDetails(this.id, this.baseVehicleId, this.sacCode, this.sacDescription, this.companyId, this.domainName, this.currencyId, this.currency, this.currencySymbol, this.driverId, this.ref, this.statusC, this.statusId, this.userId, this.firstName, this.lastName, this.userName, this.email, this.userMobile, this.userNationality, this.driverStatus, this.clientId, this.clientName, this.clientMobile, this.clientEmail, this.clientAltMobile, this.driverName, this.mobile, this.dutyStatus, this.companyName, this.mobileNo, this.landlineNo, this.gstNo, this.vehicleNo, this.year, this.color, this.vehicleName, this.packageMode, this.bookingTypeId, this.bookingType, this.bookingTypeImage, this.bookingTypeIcon, this.chargeType, this.vehicle, this.noOfVehicles, this.deviceType, this.status, this.bookingEstimationId, this.bookingId, this.estimatedTime, this.estimatedDistance, this.estimatepriceBeforeDiscount, this.discountPrice, this.estimatedPrice, this.bookingAmtPercentage, this.estimatedPriceBeforeMarkup, this.totalTaxPrice, this.approxDistanceCharge, this.approxAfterKm, this.approxAfterHour, this.approxHourCharge, this.approxWaitingCharge, this.approxWaitingMinute, this.minimumCharge, this.nightRateType, this.nightRateValue, this.nightRateBegins, this.nightRateEnds, this.nightChargePrice, this.premiumsType, this.premiumsValue, this.premiumsPrice, this.extras, this.extraPrice, this.peakTimeValue, this.peakTimePrice, this.cgstTax, this.igstTax, this.sgstTax, this.amount, this.serviceCharge, this.bookingCancellationRule, this.serviceChargeCgstAmount, this.serviceChargeIgstAmount, this.serviceChargeSgstAmount, this.serviceChargeCgst, this.serviceChargeIgst, this.serviceChargeSgst, this.serviceChargeSacCodeId, this.serviceChargeSacCode, this.serviceChargeSacCodeDescription, this.ordertime, this.departure, this.dropAddress, this.adults, this.pickupCountry, this.pickupState, this.pickupCity, this.pickupLatitude, this.pickupLongitude, this.pickupZone, this.dropLatitude, this.dropLongitude, this.localPkgName, {


    required this.id,
    required this.baseVehicleId,
    required this.sacCode,
    required this.sacDescription,
    //   this.itineraryId,
    required this.companyId,
    required this.domainName,
    required this.currencyId,
    required this.currency,
    required this.currencySymbol,
    required this.driverId,
    required this.ref,
    required this.statusC,
    required this.statusId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.userMobile,
    required this.userNationality,
    //this.userAltMobile,
    required this.driverStatus,
    required this.clientId,
    required this.clientName,
    required this.clientMobile,
    required this.clientEmail,
    this.clientAltMobile,
    required this.driverName,
    required this.mobile,
    required this.dutyStatus,
    required this.companyName,
    required this.mobileNo,
    required this.landlineNo,
    required this.gstNo,
    //this.serviceTaxGst,
    required this.vehicleNo,
    required this.year,
    required this.color,
    required this.vehicleName,
    required this.packageMode,
    required this.bookingTypeId,
    required this.bookingType,
    required this.bookingTypeImage,
    required this.bookingTypeIcon,
    required this.chargeType,
    required this.vehicle,
    required this.noOfVehicles,
    required this.bookingDate,
    required this.bookingTime,
    required this.deviceType,
    required this.status,
    required this.bookingEstimationId,
    required this.bookingId,
    required this.estimatedTime,
    required this.estimatedDistance,
    required this.estimatepriceBeforeDiscount,
    required this.discountPrice,
    required this.estimatedPrice,
    required this.bookingAmtPercentage,
    required this.estimatedPriceBeforeMarkup,
    required this.totalTaxPrice,
    required this.approxDistanceCharge,
    required this.approxAfterKm,
    required this.approxAfterHour,
    required this.approxHourCharge,
    required this.approxWaitingCharge,
    required this.approxWaitingMinute,
    required this.minimumCharge,
    required this.nightRateType,
    required this.nightRateValue,
    required this.nightRateBegins,
    required this.nightRateEnds,
    required this.nightChargePrice,
    required this.premiumsType,
    required this.premiumsValue,
    required this.premiumsPrice,
    required this.extras,
    required this.extraPrice,
    required this.peakTimeValue,
    required this.peakTimePrice,
    required this.cgstTax,
    required this.igstTax,
    required this.sgstTax,
    //required this.createdDate,
   // required this.updatedDate,
    required this.amount,
    required this.serviceCharge,
    required this.bookingCancellationRule,
    required this.serviceChargeCgstAmount,
    required this.serviceChargeIgstAmount,
    required this.serviceChargeSgstAmount,
    required this.serviceChargeCgst,
    required this.serviceChargeIgst,
    required this.serviceChargeSgst,
    required this.serviceChargeSacCodeId,
    required this.serviceChargeSacCode,
    required this.serviceChargeSacCodeDescription,
    required this.ordertime,
    required this.pickupArea,
    required this.departure,
    required this.dropArea,
    required this.dropAddress,
    required this.adults,
    required this.pickupCountry,
    required this.pickupState,
    required this.pickupCity,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.pickupZone,
    required this.dropDate,
    required this.dropTime,
    required this.dropLatitude,
    required this.dropLongitude,
    required this.localPkgName,
  

  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
       bookingTime: json['booking_time'] as String,
       bookingDate: DateTime.parse(json['booking_date']),
        pickupArea: json['pickup_area'],
        dropArea: json['drop_area'],
        dropDate: DateTime.parse(json['drop_date']),
        dropTime: json['drop_time'],
    
      id: json['id'],
      baseVehicleId: json['base_vehicle_id'],
      sacCode: json['sac_code'],
      sacDescription: json['sac_description'],
      //itineraryId: json['itinerary_id'],
      companyId: json['company_id'],
      domainName: json['domain_name'],
      currencyId: json['currency_id'],
      currency: json['currency'],
      currencySymbol: json['currency_symbol'],
      driverId: json['driver_id'],
      ref: json['ref'],
      statusC: json['status_c'],
      statusId: json['status_id'],
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      userName: json['user_name'],
      email: json['email'],
      userMobile: json['user_mobile'],
      userNationality: json['user_nationality'],
      //userAltMobile: json['user_alt_mobile'],
      driverStatus: json['driver_status'],
      clientId: json['client_id'],
      clientName: json['clientname'],
      clientMobile: json['client_mobile'],
      clientEmail: json['client_email'],
      clientAltMobile: json['client_alt_mobile'],
      driverName: json['driver_name'],
      mobile: json['mobile'],
      dutyStatus: json['duty_status'],
      companyName: json['company_name'],
      mobileNo: json['mobile_no'],
      landlineNo: json['landline_no'],
      gstNo: json['gst_no'],
      //serviceTaxGst: json['service_tax_gst'],
      vehicleNo: json['vehicle_no'],
      year: json['year'],
      color: json['color'],
      vehicleName: json['vehicle_name'],
      packageMode: json['package_mode'],
      bookingTypeId: json['booking_type_id'],
      bookingType: json['booking_type'],
      bookingTypeImage: json['booking_type_image'],
      bookingTypeIcon: json['booking_type_icon'],
      chargeType: json['charge_type'],
      vehicle: json['vehicle'],
      noOfVehicles: json['no_of_vehicles'],
      bookingDate: DateTime.parse(json['booking_date']),
      bookingTime: json['booking_time'],
      deviceType: json['device_type'],
      status: json['status'],
      bookingEstimationId: json['booking_estimation_id'],
      bookingId: json['booking_id'],
      estimatedTime: json['estimated_time'],
      estimatedDistance: json['estimated_distance'],
      estimatepriceBeforeDiscount: json['estimateprice_before_discount'],
      discountPrice: json['discount_price'],
      estimatedPrice: json['estimated__price'],
      bookingAmtPercentage: json['booking_amt_percentage'],
      estimatedPriceBeforeMarkup: json['estimated_price_before_markup'],
      totalTaxPrice: json['total_tax_price'],
      approxDistanceCharge: json['approx_distance_charge'],
      approxAfterKm: json['approx_after_km'],
      approxAfterHour: json['approx_after_hour'],
      approxHourCharge: json['approx_hour_charge'],
      approxWaitingCharge: json['approx_waiting_charge'],
      approxWaitingMinute: json['approx_waiting_minute'],
      minimumCharge: json['minimum_charge'],
      nightRateType: json['night_rate_type'],
      nightRateValue: json['night_rate_value'],
      nightRateBegins: json['night_rate_begins'],
      nightRateEnds: json['night_rate_ends'],
      nightChargePrice: json['night_charge_price'],
      premiumsType: json['premiums_type'],
      premiumsValue: json['premiums_value'],
      premiumsPrice: json['premiums_price'],
      extras: json['extras'],
      extraPrice: json['extra_price'],
      peakTimeValue: json['peak_time_value'],
      peakTimePrice: json['peak_time_price'],
      cgstTax: json['cgst_tax'],
      igstTax: json['igst_tax'],
      sgstTax: json['sgst_tax'],
      //createdDate: DateTime.parse(json['created_date']),
      //updatedDate: DateTime.parse(json['updated_date']),
      amount: json['amount'],
      serviceCharge: json['service_charge'],
      bookingCancellationRule: json['booking_cancellation_rule'],
      serviceChargeCgstAmount: json['service_charge_cgst_amount'],
      serviceChargeIgstAmount: json['service_charge_igst_amount'],
      serviceChargeSgstAmount: json['service_charge_sgst_amount'],
      serviceChargeCgst: json['service_charge_cgst'],
      serviceChargeIgst: json['service_charge_igst'],
      serviceChargeSgst: json['service_charge_sgst'],
      serviceChargeSacCodeId: json['service_charge_sac_code_id'],
      serviceChargeSacCode: json['service_charge_sac_code'],
      serviceChargeSacCodeDescription: json['service_charge_sac_code_description'],
      ordertime: json['ordertime'],
      pickupArea: json['pickup_area'],
      departure: json['departure'],
      dropArea: json['drop_area'],
      dropAddress: json['drop_address'],
      adults: json['adults'],
      pickupCountry: json['pickup_country'],
      pickupState: json['pickup_state'],
      pickupCity: json['pickup_city'],
      pickupLatitude: json['pickup_latitude'],
      pickupLongitude: json['pickup_longitude'],
      pickupZone: json['pickup_zone'],
      dropDate: DateTime.parse(json['drop_date']),
      dropTime: json['drop_time'],
      dropLatitude: json['drop_latitude'],
      dropLongitude: json['drop_longitude'],
      localPkgName: json['local_pkg_name'],
      
    );
*/

/*
  BookingListAPIResponseData({required this.status, required this.bookingList});

  factory BookingListAPIResponseData.fromJson(Map<String, dynamic> json) {
    return BookingListAPIResponseData(
      status: json['status'],
      bookingList: List<BookingDetails>.from(json['data'].map((x) => BookingDetails.fromJson(x))),
    );
  }
}

*/

  BookingDetails(
      {required this.bookingTime,
      required this.bookingDate,
      required this.pickupArea,
      required this.dropArea,
      required this.dropDate,
      required this.dropTime});

  factory BookingDetails.fromJson(Map<String, dynamic> json) {
    return BookingDetails(
      bookingTime: json['booking_time'] as String? ?? '',
      bookingDate: json['booking_date'] as String? ?? '',
      pickupArea: json['pickup_area'] as String? ?? '',
      dropArea: json['drop_area'] as String? ?? '',
      dropDate: json['drop_date'] as String? ?? '',
      dropTime: json['drop_time'] as String? ?? '',
    );
  }
}
