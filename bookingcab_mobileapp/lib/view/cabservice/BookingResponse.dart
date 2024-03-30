class BookingResponse {
  final String status;
  final String message;
  final BookingData data;

  BookingResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'],
      message: json['message'],
      data: BookingData.fromJson(json['data']),
    );
  }
}

class BookingData {
  // Filter filter;
   List<Vehicle> vehicleList;
  //final Query query;

  BookingData({
    //required this.filter,
    required this.vehicleList,
    //required this.query,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      //filter: Filter.fromJson(json['filter']),
      vehicleList: List<Vehicle>.from(json['vehicle_list'].map((x) => Vehicle.fromJson(x))),
      //query: Query.fromJson(json['query']),
    );
  }
}


class Vehicle {
   int minDistance = 0;
 // final int perHrCharge;
   int minPkgHrs = 0;
   int minPkgKm = 0;
   int markupPrice = 0;
   int markupAmount = 0;
   int vehicleTypeId = 0;
   int baseVehicleId = 0;
   String vehicleImage = '';
   String vehicleType = '';
   String vehicleName = '';
   String vehicleModel = '';
   String ignitionType = '';
   int baseFare = 0;
   int perKmPrice = 0;
   int runningAmt = 0;
   int peakTimePrice = 0;
   int nightCharge = 0;
   int extraCharge = 0;
   int taxPercentage = 0;
   int taxPrice = 0;
   int estimatedPriceBeforeMarkup = 0;
   int totalPrice = 0;
   int vehicleBaggage = 0;
   String vehicleIgnitionType = '';
   int seatingCapacity = 0;
   int luggage = 0;
   String amenities = '';
   int vehicleMasterId = 0;
   int baseCombId = 0;
   //dynamic amenitiesName;
   String vehicleColorName = '';
   String nightRateType = '';
   String nightRateValue = '';
   String nightRateBegins = '';
   String nightRateEnds = '';
   String peakFare = '';
   String cgstTax = '';
   int igstTax = 0;
   String sgstTax = '';
   int sacCodeId = 0;
   String sacCode = '';
   String sacDescription = '';
   String extras = '';
   int masterPackageModeId = 0;
   String packageMode = '';
   String estimatedTime = '';
   int duration = 0;
   int estimatedDistance = 0;
   String approxWaitingCharge = '';
   String approxWaitingMinute = '';
   String localPkgName = '';
   int vendorId = 0;
   String vendorName = '';
   String vendorEmail = '';
   String vendorMobile = '';
   String premiumsType = '';
   String premiumsValue = '';
   int premiumsPrice = 0;
   String userMarkup = '';
   String startDate = '';
   String endDate = '';
 // final dynamic startTime;
  //final dynamic endTime;
   int dispatchType;
 // final dynamic garageType;
  //final dynamic garageAddress;
  //final dynamic garagePincode;
   String garageLatitude = '';
   String garageLongitude = '';
  // dynamic companyShareType;
  // dynamic driverShareType;
   int driverShareValue = 0;
  // dynamic partnerShareType;
   int partnerShareValue = 0;
   int userRating = 0;
   String cancellationFareRule = '';
   String bookingAutoRelasedate = '';
   int travelDays = 0;
   String travelHour = '';
   String currencyFaicon = '';
   String createdDate = '';
   int stateTax = 0;
   int tollTax = 0;
   int serviceCharge = 0;
   int rating = 0;
   int vehicleCategory = 0;
   int showServiceCharge = 0;
   int sacCodeIdService = 0;
   String sacCodeService = '';
   String sacDescriptionService = '';
   int serviceTaxPercentage;
   int serviceCgstTax = 0;
   int serviceIgstTax = 0;
   int serviceSgstTax = 0;
   int serviceTaxPrice = 0;
   int serviceChargeCgstAmount = 0;
   int serviceChargeIgstAmount = 0;
   int serviceChargeSgstAmount = 0;
   int markupCgst = 0;
   int markupIgst = 0;
   int markupSgst = 0;
   int markupCgstAmount = 0;
   int markupIgstAmount = 0;
   int markupSgstAmount = 0;
   String basePath = "";

  Vehicle({
    required this.minDistance,
    required this.minPkgHrs,
    required this.minPkgKm,
    required this.markupPrice,
    required this.markupAmount,
    required this.vehicleTypeId,
    required this.baseVehicleId,
    required this.vehicleImage,
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleModel,
    required this.ignitionType,
    required this.baseFare,
    required this.perKmPrice,
    required this.runningAmt,
    required this.peakTimePrice,
    required this.nightCharge,
    required this.extraCharge,
    required this.taxPercentage,
    required this.taxPrice,
    required this.estimatedPriceBeforeMarkup,
    required this.totalPrice,
    required this.vehicleBaggage,
    required this.vehicleIgnitionType,
    required this.seatingCapacity,
    required this.luggage,
    required this.amenities,
    required this.vehicleMasterId,
    required this.baseCombId,
    //required this.amenitiesName,
    required this.vehicleColorName,
    required this.nightRateType,
    required this.nightRateValue,
    required this.nightRateBegins,
    required this.nightRateEnds,
    required this.peakFare,
    required this.cgstTax,
    required this.igstTax,
    required this.sgstTax,
    required this.sacCodeId,
    required this.sacCode,
    required this.sacDescription,
    required this.extras,
    required this.masterPackageModeId,
    required this.packageMode,
    required this.estimatedTime,
    required this.duration,
    required this.estimatedDistance,
    required this.approxWaitingCharge,
    required this.approxWaitingMinute,
    required this.localPkgName,
    required this.vendorId,
    required this.vendorName,
    required this.vendorEmail,
    required this.vendorMobile,
    required this.premiumsType,
    required this.premiumsValue,
    required this.premiumsPrice,
    required this.userMarkup,
    required this.startDate,
    required this.endDate,
    //required this.startTime,
   // required this.endTime,
    required this.dispatchType,
    //required this.garageType,
    //required this.garageAddress,
    //required this.garagePincode,
    required this.garageLatitude,
    required this.garageLongitude,
    //required this.companyShareType,
   // required this.driverShareType,
    required this.driverShareValue,
   // required this.partnerShareType,
    required this.partnerShareValue,
    required this.userRating,
    required this.cancellationFareRule,
    required this.bookingAutoRelasedate,
    required this.travelDays,
    required this.travelHour,
    required this.currencyFaicon,
    required this.createdDate,
    required this.stateTax,
    required this.tollTax,
    required this.serviceCharge,
    required this.rating,
    required this.vehicleCategory,
    required this.showServiceCharge,
    required this.sacCodeIdService,
    required this.sacCodeService,
    required this.sacDescriptionService,
    required this.serviceTaxPercentage,
    required this.serviceCgstTax,
    required this.serviceIgstTax,
    required this.serviceSgstTax,
    required this.serviceTaxPrice,
    required this.serviceChargeCgstAmount,
    required this.serviceChargeIgstAmount,
    required this.serviceChargeSgstAmount,
    required this.markupCgst,
    required this.markupIgst,
    required this.markupSgst,
    required this.markupCgstAmount,
    required this.markupIgstAmount,
    required this.markupSgstAmount,
    required this.basePath,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      minDistance: json['min_distance'] as int? ?? 0,
      minPkgHrs: json['min_pkg_hrs'] as int? ?? 0,
      minPkgKm: json['min_pkg_km'] as int? ?? 0,
      markupPrice: json['markup_price'] as int? ?? 0,
      markupAmount: json['markup_amount'] as int? ?? 0,
      vehicleTypeId: json['vehicle_type_id'] as int? ?? 0,
      baseVehicleId: json['base_vehicle_id'] as int? ?? 0,
      vehicleImage: json['vehicle_image'] as String? ?? '',
      vehicleType: json['vehicle_type'] as String? ?? '',
      vehicleName: json['vehicle_name'] as String? ?? '',
      vehicleModel: json['vehicle_model'] as String? ?? '',
      ignitionType: json['ignition_type'] as String? ?? '',
      baseFare: json['base_fare'] as int? ?? 0,
      perKmPrice: json['per_km_price'] as int? ?? 0,
      runningAmt: json['running_amt'] as int? ?? 0,
      peakTimePrice: json['peak_time_price'] as int? ?? 0,
      nightCharge: json['night_charge'] as int? ?? 0,
      extraCharge: json['extra_charge'] as int? ?? 0,
      taxPercentage: json['tax_percentage'] as int? ?? 0,
      taxPrice: json['tax_price'] as int? ?? 0,
      estimatedPriceBeforeMarkup: json['estimated_price_before_markup'] as int? ?? 0,
      totalPrice: json['total_price'] as int? ?? 0,
      vehicleBaggage: json['vehicle_baggage'] as int? ?? 0,
      vehicleIgnitionType: json['vehicle_ignition_type'] as String? ?? '',
      seatingCapacity: json['seating_capacity'] as int? ?? 0,
      luggage: json['luggage'] as int? ?? 0,
      amenities: json['amenities'] as String? ?? '',
      vehicleMasterId: json['vehicle_master_id'],
      baseCombId: json['base_comb_id'] as int? ?? 0,
      //amenitiesName: json['amenities_name'],
      vehicleColorName: json['vehicle_color_name'] as String? ?? '',
      nightRateType: json['night_rate_type'] as String? ?? '',
      nightRateValue: json['night_rate_value'] as String? ?? '',
      nightRateBegins: json['night_rate_begins'] as String? ?? '',
      nightRateEnds: json['night_rate_ends'] as String? ?? '',
      peakFare: json['peakFare'] as String? ?? '',
      cgstTax: json['cgst_tax'] as String? ?? '',
      igstTax: json['igst_tax'] as int? ?? 0,
      sgstTax: json['sgst_tax'] as String? ?? '',
      sacCodeId: json['sac_code_id'] as int? ?? 0,
      sacCode: json['sac_code'] as String? ?? '',
      sacDescription: json['sac_description'] as String? ?? '',
      extras: json['extras'] as String? ?? '',
      masterPackageModeId: json['master_package_mode_id'] as int? ?? 0,
      packageMode: json['package_mode'] as String? ?? '',
      estimatedTime: json['estimated_time'] as String? ?? '',
      duration: json['duration'] as int? ?? 0,
      estimatedDistance: json['estimated_distance'] as int? ?? 0,
      approxWaitingCharge: json['approx_waiting_charge'] as String? ?? '',
      approxWaitingMinute: json['approx_waiting_minute'] as String? ?? '',
      localPkgName: json['local_pkg_name'] as String? ?? '',
      vendorId: json['vendor_id'] as int? ?? 0,
      vendorName: json['vendor_name'] as String? ?? '',
      vendorEmail: json['vendor_email'] as String? ?? '',
      vendorMobile: json['vendor_mobile'] as String? ?? '',
      premiumsType: json['premiums_type'] as String? ?? '',
      premiumsValue: json['premiums_value'] as String? ?? '',
      premiumsPrice: json['premiums_price'] as int? ?? 0,
      userMarkup: json['user_markup'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      //startTime: json['start_time'],
     // endTime: json['end_time'],
      dispatchType: json['dispatch_type'] as int? ?? 0,
     // garageType: json['garage_type'],
     // garageAddress: json['garage_address'],
     // garagePincode: json['garage_pincode'],
      garageLatitude: json['garage_latitude'] as String? ?? '',
      garageLongitude: json['garage_longitude'] as String? ?? '',
     // companyShareType: json['company_share_type'],
      //driverShareType: json['driver_share_type'],
      driverShareValue: json['driver_share_value'] as int? ?? 0,
     // partnerShareType: json['partnerShareType'],
      partnerShareValue: json['partner_share_value'] as int? ?? 0,
      userRating: json['user_rating'] as int? ?? 0,
      cancellationFareRule: json['cancellation_fare_rule'] as String? ?? '',
      bookingAutoRelasedate: json['booking_auto_relasedate'] as String? ?? '',
      travelDays: json['travel_days'] as int? ?? 0,
      travelHour: json['travel_hour'] as String? ?? '',
      currencyFaicon: json['currency_faicon'] as String? ?? '',
      createdDate: json['created_date'] as String? ?? '',
      stateTax: json['state_tax'] as int? ?? 0,
      tollTax: json['toll_tax'] as int? ?? 0,
      serviceCharge: json['service_charge'] as int? ?? 0,
      rating: json['rating'] as int? ?? 0,
      vehicleCategory: json['vehicle_category'] as int? ?? 0,
      showServiceCharge: json['show_service_charge'] as int? ?? 0,
      sacCodeIdService: json['sac_code_id_service'] as int? ?? 0,
      sacCodeService: json['sac_code_service'] as String? ?? '',
      sacDescriptionService: json['sac_description_service'] as String? ?? '',
      serviceTaxPercentage: json['service_tax_percentage'] as int? ?? 0,
      serviceCgstTax: json['service_cgst_tax'] as int? ?? 0,
      serviceIgstTax: json['service_igst_tax'] as int? ?? 0,
      serviceSgstTax: json['service_sgst_tax'] as int? ?? 0,
      serviceTaxPrice: json['service_tax_price'] as int? ?? 0,
      serviceChargeCgstAmount: json['service_charge_cgst_amount'] as int? ?? 0,
      serviceChargeIgstAmount: json['service_charge_igst_amount'] as int? ?? 0,
      serviceChargeSgstAmount: json['service_charge_sgst_amount'] as int? ?? 0,
      markupCgst: json['markup_cgst'] as int? ?? 0,
      markupIgst: json['markup_igst'] as int? ?? 0,
      markupSgst: json['markup_sgst'] as int? ?? 0,
      markupCgstAmount: json['markup_cgst_amount'] as int? ?? 0,
      markupIgstAmount: json['markup_igst_amount'] as int? ?? 0,
      markupSgstAmount: json['markup_sgst_amount'] as int? ?? 0,
      basePath: json['basePath'] as String? ?? "",
    );
  }
}



class Filter {
  final Map<String, dynamic> vehicleType;
  final Map<String, dynamic> vendorDetail;
  final Map<String, dynamic> vehicleModel;
  final Map<String, dynamic> vehicleColor;
  final List<dynamic> vehicleName;
  final Map<String, dynamic> ratingFilter;
  final Map<String, dynamic> amenitiesFilter;
  final Map<String, dynamic> seatingCapacity;
  final Map<String, dynamic> cancellationFareRule;
  final Map<String, dynamic> vehicleNameFilter;
  final Map<String, dynamic> fuelType;
  final String vehicleTypeLabel;
  final String vehicleModelLabel;
  final String vehicleColorLabel;
  final String amenitiesLabel;
  final String fuelLabel;
  final String cancellationPolicyLabel;
  final String ratingLabel;
  final String seatingCapacityLabel;
  final String supplierLabel;

  Filter({
    required this.vehicleType,
    required this.vendorDetail,
    required this.vehicleModel,
    required this.vehicleColor,
    required this.vehicleName,
    required this.ratingFilter,
    required this.amenitiesFilter,
    required this.seatingCapacity,
    required this.cancellationFareRule,
    required this.vehicleNameFilter,
    required this.fuelType,
    required this.vehicleTypeLabel,
    required this.vehicleModelLabel,
    required this.vehicleColorLabel,
    required this.amenitiesLabel,
    required this.fuelLabel,
    required this.cancellationPolicyLabel,
    required this.ratingLabel,
    required this.seatingCapacityLabel,
    required this.supplierLabel,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      vehicleType: Map<String, dynamic>.from(json['vehicle_type']),
      vendorDetail: Map<String, dynamic>.from(json['vendor_detail']),
      vehicleModel: Map<String, dynamic>.from(json['vehicle_model']),
      vehicleColor: Map<String, dynamic>.from(json['vehicle_color']),
      vehicleName: json['vehicle_name'],
      ratingFilter: Map<String, dynamic>.from(json['rating_filter']),
      amenitiesFilter: Map<String, dynamic>.from(json['amenities_filter']),
      seatingCapacity: Map<String, dynamic>.from(json['seating_capacity']),
      cancellationFareRule: Map<String, dynamic>.from(json['cancellation_fare_rule']),
      vehicleNameFilter: Map<String, dynamic>.from(json['vehicle_name_filter']),
      fuelType: Map<String, dynamic>.from(json['fuel_type']),
      vehicleTypeLabel: json['vehicle_type_label'],
      vehicleModelLabel: json['vehicle_model_label'],
      vehicleColorLabel: json['vehicle_color_label'],
      amenitiesLabel: json['amenities_label'],
      fuelLabel: json['fuel_label'],
      cancellationPolicyLabel: json['cancellation_policy_label'],
      ratingLabel: json['rating_label'],
      seatingCapacityLabel: json['seating_capacity_label'],
      supplierLabel: json['supplier_label'],
    );
  }
}


class Query {
  final String cityId;
  final String stateId;
  final String countryId;
  final String masterPackageId;
  final String localPackageId;
  final String pickupTime;
  final String companyId;
  final String userId;
  final String userGrade;
  final String userType;
  final String companyGstno;
  final String userGstno;
  final String parentId;
  final String seatingCapacity;
  final String luggage;
  final String pickupDate;
  final String currencyId;
  final int vehicleType;
  final String tempId;
  final String masterBookingTypeId;
  final String totalDays;
  final String dropDate;
  final String dropTime;
  final int noOfVehicles;

  Query({
    required this.cityId,
    required this.stateId,
    required this.countryId,
    required this.masterPackageId,
    required this.localPackageId,
    required this.pickupTime,
    required this.companyId,
    required this.userId,
    required this.userGrade,
    required this.userType,
    required this.companyGstno,
    required this.userGstno,
    required this.parentId,
    required this.seatingCapacity,
    required this.luggage,
    required this.pickupDate,
    required this.currencyId,
    required this.vehicleType,
    required this.tempId,
    required this.masterBookingTypeId,
    required this.totalDays,
    required this.dropDate,
    required this.dropTime,
    required this.noOfVehicles,
  });

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      cityId: json['city_id'],
      stateId: json['state_id'],
      countryId: json['country_id'],
      masterPackageId: json['master_package_id'],
      localPackageId: json['local_package_id'],
      pickupTime: json['pickup_time'],
      companyId: json['company_id'],
      userId: json['user_id'],
      userGrade: json['user_grade'],
      userType: json['user_type'],
      companyGstno: json['company_gstno'],
      userGstno: json['user_gstno'],
      parentId: json['parent_id'],
      seatingCapacity: json['seating_capacity'],
      luggage: json['luggage'],
      pickupDate: json['pickup_date'],
      currencyId: json['currency_id'],
      vehicleType: json['vehicle_type'],
      tempId: json['temp_id'],
      masterBookingTypeId: json['master_booking_type_id'],
      totalDays: json['total_days'],
      dropDate: json['drop_date'],
      dropTime: json['drop_time'],
      noOfVehicles: json['no_of_vehicles'],
    );
  }
}

