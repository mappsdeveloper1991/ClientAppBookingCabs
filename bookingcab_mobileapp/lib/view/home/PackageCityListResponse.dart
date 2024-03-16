class PackageCityListResponse {
  final List<CityList> cityList;

  PackageCityListResponse({required this.cityList});

  factory PackageCityListResponse.fromJson(Map<String, dynamic> json) {
    return PackageCityListResponse(
      //status: json['responsedata']['status'],
      cityList: List<CityList>.from(json['response'].map((x) => CityList.fromJson(x))),
    );
  }
}

class CityList {
  final int cityId;
  final int status;
  final String cityName;
  final String latitude;
  final String longitude;
  final String northEastLatitude;
  final String northEastLongitude;
  final String southWestLatitude;
  final String southWestLongitude;
  final String stateName;
  final String countryCode;
  final int countryId;

  CityList({
    required this.cityId,
    required this.status,
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.northEastLatitude,
    required this.northEastLongitude,
    required this.southWestLatitude,
    required this.southWestLongitude,
    required this.stateName,
    required this.countryCode,
    required this.countryId,
  });

  factory CityList.fromJson(Map<String, dynamic> json) {
    return CityList(
      cityId: json['city_id'],
      status: json['status'],
      cityName: json['city_name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      northEastLatitude: json['north_east_latitude'],
      northEastLongitude: json['north_east_longitude'],
      southWestLatitude: json['south_west_latitude'],
      southWestLongitude: json['south_west_longitude'],
      stateName: json['state_name'],
      countryCode: json['country_code'],
      countryId: json['country_id'],
    );
  }
}
