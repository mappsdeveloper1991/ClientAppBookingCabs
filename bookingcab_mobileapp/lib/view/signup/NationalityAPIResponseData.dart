class NationalityAPIResponseData {
   String status = '';
   List<NationalityList> data = [];

  NationalityAPIResponseData({
    required this.status,
    required this.data,
  });

  factory NationalityAPIResponseData.fromJson(Map<String, dynamic> json) {
    return NationalityAPIResponseData(
      status: json['status'],
     // data: List<NationalityList>.from( json['data'].map((x) => NationalityList.fromJson(x))),
      // data: json['data'] != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null,
      data: json['data'] != null ? List<NationalityList>.from( json['data'].map((x) => NationalityList.fromJson(x))) : []
    );
  }
}

class NationalityList {
   String nationality = '';
   int countryId = 0;

  NationalityList({
    required this.nationality,
    required this.countryId,
  });

  factory NationalityList.fromJson(Map<String, dynamic> json) {
    return NationalityList(
      nationality: json['nationality'] as String? ?? '',
      countryId: json['country_id'] as int? ?? 0);
  }

  @override
  String toString() {
    return nationality;
  }
}
