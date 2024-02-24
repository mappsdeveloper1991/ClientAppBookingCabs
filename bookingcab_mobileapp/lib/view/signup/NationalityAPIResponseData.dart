class NationalityAPIResponseData {
  final String status;
  final List<NationalityList> data;

  NationalityAPIResponseData({
    required this.status,
    required this.data,
  });

  factory NationalityAPIResponseData.fromJson(Map<String, dynamic> json) {
    return NationalityAPIResponseData(
      status: json['status'],
      data: List<NationalityList>.from(json['data'].map((x) => NationalityList.fromJson(x))),
    );
  }
}

class NationalityList {
  final String nationality;
  final int countryId;

  NationalityList({
    required this.nationality,
    required this.countryId,
  });

  factory NationalityList.fromJson(Map<String, dynamic> json) {
    return NationalityList(
      nationality: json['nationality'],
      countryId: json['country_id'],
    );
  }

   @override
  String toString() {
    return nationality;
  }
}
