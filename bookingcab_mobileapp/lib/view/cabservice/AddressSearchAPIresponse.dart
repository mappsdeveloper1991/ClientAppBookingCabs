class AddressSearchAPIresponse {
   String status = '';
   List<AddressList> addressList = [];

  AddressSearchAPIresponse({
    required this.status,
    required this.addressList,
  });

  factory AddressSearchAPIresponse.fromJson(Map<String, dynamic> json) {
    return AddressSearchAPIresponse(
      status: json['status'],
     // data: List<NationalityList>.from( json['data'].map((x) => NationalityList.fromJson(x))),
      // data: json['data'] != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null,
      addressList: json['data'] != null ? List<AddressList>.from( json['data'].map((x) => AddressList.fromJson(x))) : []
    );
  }
}


class AddressList {
   int countryId = 0;
   int stateId= 0;
   int cityId= 0;
   String latitude = '';
   String longitude = '';
   String address = '';
   String zone = '';
   int id = 0;

  AddressList({
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.zone,
    required this.id,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) {
    return AddressList(
      countryId: json['country_id'] as int? ?? 0,
      stateId: json['state_id'] as int? ?? 0,
      cityId: json['city_id'] as int? ?? 0,
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude']as String? ?? '',
      address: json['address']as String? ?? '',
      zone: json['zone']as String? ?? '',
      id: json['id']as int? ?? 0,
    );
  }
}
