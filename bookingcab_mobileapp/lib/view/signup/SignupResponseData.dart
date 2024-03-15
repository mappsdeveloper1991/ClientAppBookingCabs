class SignupResponseData {
  String? status = "";
  Data? data;

  SignupResponseData({required this.status, required this.data});

  factory SignupResponseData.fromJson(Map<String, dynamic> json) {
    return SignupResponseData(
      status: json['status'] as String,
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Data {
  //int? fieldCount;
  //int? affectedRows;
  //int? insertId;
  //int? serverStatus;
  //int? warningCount;
  String message = "";
  //bool protocol41;
  //int changedRows;
  String emailMessage;
  int userId;
  String code;
  String status = "";

  Data({
    //required this.fieldCount,
    //required this.affectedRows,
    //required this.insertId,
    //required this.serverStatus,
    // required this.warningCount,
    required this.message,
    //required this.protocol41,
    // required this.changedRows,
    required this.emailMessage,
    required this.userId,
    required this.code,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      //fieldCount: json['fieldCount'] as int,
      //affectedRows: json['affectedRows'] as int,
      //insertId: json['insertId'] as int,
      //serverStatus: json['serverStatus'] as int,
      //warningCount: json['warningCount'] as int,
      message: json['message'] as String? ?? '',
      //protocol41: json['protocol41'] as bool,
      //changedRows: json['changedRows'] as int,
      emailMessage: json['emailmessage'] as String? ?? '',
      userId: json['user_id'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );
  }
}
