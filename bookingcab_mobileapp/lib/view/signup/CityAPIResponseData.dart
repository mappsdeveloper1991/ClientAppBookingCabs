class CityAPIResponseData {
  String status;
  List<City> data;

  CityAPIResponseData({
    required this.status,
    required this.data,
  });

  factory CityAPIResponseData.fromJson(Map<String, dynamic> json) {
    return CityAPIResponseData(
      status: json['status'],
      data: List<City>.from(json['data'].map((x) => City.fromJson(x))),
    );
  }
}

class City {
  final int cityId;
  final int currencyId;
  final String currency;
  final String currencySymbol;
  final String cityRadius;
  final String latitude;
  final String longitude;
  final String northEastLatitude;
  final String northEastLongitude;
  final String southWestLatitude;
  final String southWestLongitude;
  final int status;
  final int stateId;
  final int countryId;
  final String cityStateCountry;

  City({
    required this.cityId,
    required this.currencyId,
    required this.currency,
    required this.currencySymbol,
    required this.cityRadius,
    required this.latitude,
    required this.longitude,
    required this.northEastLatitude,
    required this.northEastLongitude,
    required this.southWestLatitude,
    required this.southWestLongitude,
    required this.status,
    required this.stateId,
    required this.countryId,
    required this.cityStateCountry,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'],
      currencyId: json['currency_id'],
      currency: json['currency'],
      currencySymbol: json['currency_symbol'],
      cityRadius: json['city_radius'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      northEastLatitude: json['north_east_latitude'],
      northEastLongitude: json['north_east_longitude'],
      southWestLatitude: json['south_west_latitude'],
      southWestLongitude: json['south_west_longitude'],
      status: json['status'],
      stateId: json['state_id'],
      countryId: json['country_id'],
      cityStateCountry: json['citystatecountry'],
    );
  }

  @override
  String toString() {
    return cityStateCountry;
  }
}
