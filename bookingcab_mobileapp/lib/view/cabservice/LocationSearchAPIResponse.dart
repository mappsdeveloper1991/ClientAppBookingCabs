class LocationSearchAPIResponse {
   String status = '';
   List<LocationList> locationList = [];

  LocationSearchAPIResponse({
    required this.status,
    required this.locationList,
  });

  factory LocationSearchAPIResponse.fromJson(Map<String, dynamic> json) {
    return LocationSearchAPIResponse(
      status: json['status'],
      locationList: json['data'] != null ? List<LocationList>.from( json['data'].map((x) => LocationList.fromJson(x))) : []
    );
  }
}

class LocationList {
   int id = 0;
   int countryId = 0;
   int stateId = 0;
   int cityId = 0;
   String latitude = "";
   String longitude= "";
   String area= "";
   String zone= "";

  LocationList({
    required this.id,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
    required this.area,
    required this.zone,
  });

  factory LocationList.fromJson(Map<String, dynamic> json) {
    return LocationList(
      id: json['id'] as int? ?? 0,
      countryId: json['country_id'] as int? ?? 0,
      stateId: json['state_id'] as int? ?? 0,
      cityId: json['city_id'] as int? ?? 0,
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      area: json['area'] as String? ?? '',
      zone: json['zone'] as String? ?? '',
    );
  }
}
