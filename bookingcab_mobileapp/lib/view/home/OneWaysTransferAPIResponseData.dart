class OneWaysTransferAPIResponseData {
   String status;
   List<OneWayPackageList> packageList;

  OneWaysTransferAPIResponseData({required this.status, required this.packageList});

  factory OneWaysTransferAPIResponseData.fromJson(Map<String, dynamic> json) {
    return OneWaysTransferAPIResponseData(
      status: json['status'],
      packageList: List<OneWayPackageList>.from(json['data'].map((x) => OneWayPackageList.fromJson(x))),
    );
  }
}

class OneWayPackageList {
   int baseCombId = 0;
   String fareType = '';
   String dateFrom = '';
   String dateTo = '';
   int minimumCharge = 0;
   String currency = '';
   String currencySymbol = '';
   int minimumDistance = 0;
   int perKmCharge = 0;
   int masterPackageModeId = 0;
   String packageMode = '';
   int masterPackageId = 0;
   String packageName = '';
  // String image;
   int baseVehicleId = 0;
   int masterVehicleTypeId = 0;
   String vehicleType = '';
   String vehicleImage = '';
   String seatingCapacity = '';
   int luggage = 0;
   String startTime = '';
   String endTime = '';
   String vendorName = '';
   String vendorEmail = '';
   String vendorMobile = '';
   int cityDistanceId = 0;
   String sourceCityId = '';
   String destinationCityId = '';
   String sourceCityName  = '';
   String sourceStateName = '';
   String sourceCountryCode = '';
   String destinationCityName = '';
   String destinationStateName = '';
   String destinationCountryCode = '';
   String driverAllowance = '';
   int tollTax = 0;
   int parkingCharge = 0;
   int cityTax = 0;
   int totalCharge = 0;

  OneWayPackageList({
    required this.baseCombId,
    required this.fareType,
    required this.dateFrom,
    required this.dateTo,
    required this.minimumCharge,
    required this.currency,
    required this.currencySymbol,
    required this.minimumDistance,
    required this.perKmCharge,
    required this.masterPackageModeId,
    required this.packageMode,
    required this.masterPackageId,
    required this.packageName,
    //required this.image,
    required this.baseVehicleId,
    required this.masterVehicleTypeId,
    required this.vehicleType,
    required this.vehicleImage,
    required this.seatingCapacity,
    required this.luggage,
    required this.startTime,
    required this.endTime,
    required this.vendorName,
    required this.vendorEmail,
    required this.vendorMobile,
    required this.cityDistanceId,
    required this.sourceCityId,
    required this.destinationCityId,
    required this.sourceCityName,
    required this.sourceStateName,
    required this.sourceCountryCode,
    required this.destinationCityName,
    required this.destinationStateName,
    required this.destinationCountryCode,
    required this.driverAllowance,
    required this.tollTax,
    required this.parkingCharge,
    required this.cityTax,
    required this.totalCharge,
  });

  factory OneWayPackageList.fromJson(Map<String, dynamic> json) {
    return OneWayPackageList(
      baseCombId: json['base_comb_id'] as int? ?? 0,
      fareType: json['fare_type'] as String? ?? '',
      dateFrom: json['date_from'] as String? ?? '',
      dateTo: json['date_to'] as String? ?? '',
      minimumCharge: json['minimun_charge'] as int? ?? 0,
      currency: json['currency'] as String? ?? '',
      currencySymbol: json['currency_symbol'] as String? ?? '',
      minimumDistance: json['minimum_distance'] as int? ?? 0,
      perKmCharge: json['per_km_charge'] as int? ?? 0,
      masterPackageModeId: json['master_package_mode_id'] as int? ?? 0,
      packageMode: json['package_mode'] as String? ?? '',
      masterPackageId: json['master_package_id'] as int? ?? 0,
      packageName: json['package_name'] as String? ?? '',
      //image: json['image'] as String? ?? '',
      baseVehicleId: json['base_vehicle_id'] as int? ?? 0,
      masterVehicleTypeId: json['master_vehicle_type_id'] as int? ?? 0,
      vehicleType: json['vehicle_type'] as String? ?? '',
      vehicleImage: json['vehicle_image'] as String? ?? '',
      seatingCapacity: json['seating_capacity'] as String? ?? '',
      luggage: json['luggage'] as int? ?? 0,
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
      vendorName: json['vendor_name'] as String? ?? '',
      vendorEmail: json['vendor_email'] as String? ?? '',
      vendorMobile: json['vendor_mobile'] as String? ?? '',
      cityDistanceId: json['city_distance_id'] as int? ?? 0,
      sourceCityId: json['source_city_id'] as String? ?? '',
      destinationCityId: json['destination_city_id'] as String? ?? '',
      sourceCityName: json['source_city_name'] as String? ?? '',
      sourceStateName: json['source_state_name'] as String? ?? '',
      sourceCountryCode: json['source_country_code'] as String? ?? '',
      destinationCityName: json['destination_city_name'] as String? ?? '',
      destinationStateName: json['destination_state_name'] as String? ?? '',
      destinationCountryCode: json['destination_country_code'] as String? ?? '',
      driverAllowance: json['driver_allowance'] as String? ?? '',
      tollTax: json['toll_tax'] as int? ?? 0,
      parkingCharge: json['parking_charge'] as int? ?? 0,
      cityTax: json['city_tax'] as int? ?? 0,
      totalCharge: json['total_charge'] as int? ?? 0,
    );
  }
}
