class AirportRailwayAPIResponse {
   String status = '';
   List<AirportRailwayList> airportRailwayList = [];

  AirportRailwayAPIResponse({
    required this.status,
    required this.airportRailwayList,
  });

  factory AirportRailwayAPIResponse.fromJson(Map<String, dynamic> json) {
    return AirportRailwayAPIResponse(
      status: json['status'],
      airportRailwayList: json['data'] != null ? List<AirportRailwayList>.from( json['data'].map((x) => AirportRailwayList.fromJson(x))) : []
    );
  }
}

class AirportRailwayList {
   int id = 0;
   int countryId = 0;
   int stateId = 0;
   int cityId = 0;
   String pickupType = '';
   String airportRailwayName = '';
   String meetingPoint = '';
   String latitude = '';
   String longitude = '';
  // String zone;
 // String createdDate;
   //int createdBy;
   //int modifiedBy;
  // int status;

  AirportRailwayList({
    required this.id,
   required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.pickupType, 
    required this.airportRailwayName,
    required this.meetingPoint,
    required this.latitude,
    required this.longitude,
  /*  required this.zone,
    required this.createdDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.status, */
  });

  factory AirportRailwayList.fromJson(Map<String, dynamic> json) {
    return AirportRailwayList(
      id: json['id'] as int? ?? 0,
      countryId: json['country_id']  ?? 0,
      stateId: json['state_id']  ?? 0,
      cityId: json['city_id']  ?? 0,
      pickupType: json['pickup_type'] as String? ?? '' ,  
      airportRailwayName: json['airport_railway_name'] as String? ?? '',
     meetingPoint: json['meeting_point'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
     /*  zone: json['zone'],
      createdDate: json['created_date'],
      createdBy: json['created_by'],
      modifiedBy: json['modified_by'],
      status: json['status'], */
    );
  }
}
