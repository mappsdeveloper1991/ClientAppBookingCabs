class LanguageResponseData {
  final String status;
  final List<Language> languageListData;

  LanguageResponseData({
    required this.status,
    required this.languageListData,
  });

  factory LanguageResponseData.fromJson(Map<String, dynamic> json) {
    return LanguageResponseData(
      status: json['status'],
      languageListData: List<Language>.from(
        json['data'].map((languageJson) => Language.fromJson(languageJson)),
      ),
    );
  }
}

class Language {
  final int languageId;
  final String languageName;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int createdBy;
  final int? modifiedBy; // Nullable field
  final int status;

  Language({
    required this.languageId,
    required this.languageName,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
    required this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      languageId: json['language_id'],
      languageName: json['language_name'],
      createdDate: DateTime.parse(json['created_date']),
      modifiedDate: DateTime.parse(json['modified_date']),
      createdBy: json['created_by'],
      modifiedBy: json['modified_by'],
      status: json['status'],
    );
  }
}
