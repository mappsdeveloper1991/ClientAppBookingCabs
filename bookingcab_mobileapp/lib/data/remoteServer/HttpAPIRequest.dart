// ignore_for_file: non_constant_identifier_names, constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;

const userID = '457';


const String baseURL = "https://api.bookingcabs.com";
const String portNo = ":3001";
const String subURL = "/api/v1/";
const String subURLUser = "user/";
const String subURLActivation = "activation/";

const String  finalBaseURL = "$baseURL$portNo$subURL";


const  String API_LOGIN_EMAIL_MOBILE_WITH_PASSWORD = "${subURLUser}login";
const String loginByEmailAPINameGetOTP = "${subURLUser}getuserbyusername";
const String newSignUpEndPoint = "${subURLUser}newsignup";
const String forGotPasswordEndPointGetOTP = "${subURLUser}forgotuserpassword";
const String forGotPasswordEndPointVerifyOTP = "${subURLUser}changeuserpassword";
const String accountChangePassword = "${subURLUser}changePassword";
const String userProfileInforEndPOint = "${subURLUser}userpersonalinfo?user_id=$userID";



const String Verify_OTP = "${subURLActivation}fetchOtp";


const String SUCCESS_STATUS = "success";
const String FAILED_STATUS = "failed";
const String SOMETHING_WENT_WRONG_MSG = "Something went wrong please try again";
const String INVALID_EMAIL_MSG = "Please enter the valid email id or mobile number";
const String INVALID_PASSWORD_MSG = "Please enter the valid password";
const String INVALID_OLD_PASSWORD_MSG = "Please enter the valid old password";
const String INVALID_OTP_MSG = "Please enter the valid OTP";
const String INVALID_FIRST_NAME_MSG = "Please enter your first name";
const String INVALID_LAST_NAME_MSG = "Please enter your last name";
const String INVALID_EMAIL_ID_MSG = "Please enter the valid email id";
const String INVALID_PHONE_NO_MSG = "Please enter the valid mobile no";
const String INVALID_CONFIRM_PASSORD_MSG = "Please enter the valid password";
const String INVALID_PASSWORD_CONFIRM_PASSWORD_MSG = "Password and confirm password should be same";
const String INVALID_CITY_MSG = "Please slect your city";
const String INVALID_NATIONALITY_MSG = "Please slect your nationality";



// Method for making GET requests
   Future<http.Response> getRequest(String endpoint) async {
    try {
       String APIURL = '$finalBaseURL/$endpoint';
      print('API Request ApiURL: $APIURL   ');

      final response = await http.get(Uri.parse(APIURL));
      if (response.statusCode == 200) {
          print('API Request Response: success: Data: ${response.body}');
          return response;
       } else {
          print('API Request Response: failed: Data: ${response.reasonPhrase}');
          throw Exception('Failed: ${response.reasonPhrase}');
       }
    } catch (e) {
          print('API Request Response: exception message: ${e.toString()}');
          throw Exception('Exception');
    }
  }




  // Method for making POST requests
   Future<http.Response> postRequest(String apiEndPointName, Map<String, Object> bodydata) async {
        try{
          String APIURL = '$finalBaseURL$apiEndPointName';
           print('API Request ApiURL: $APIURL    bodyData: $bodydata');

            final Map<String, String> headers = {
                  'Content-Type': 'application/json',
                };
                

                var response  = await http.post(
                  Uri.parse(APIURL),
                  headers: headers,
                  body: json.encode(bodydata),
                );

                if (response.statusCode == 200) {
                  print('API Request Response: success: Data: ${response.body}');
                  // Handle the response data here
                  return response;
                } else {
                  print('API Request Response: failed: Data: ${response.reasonPhrase}');
                  throw Exception('Failed: ${response.reasonPhrase}');
                }
        }catch(e){
            print('API Request Response: exception message: ${e.toString()}');
            throw Exception('Exception');
        }
  }


/*

  // Method for making POST requests
   Future<http.Response> postRequest(String endpoint, Map<String, Object> bodydata) async {



    var headers = {
      'Content-Type': 'application/json'  
    };

print(bodydata);
var request = http.Request('POST', Uri.parse('https://api.bookingcabs.com:3001/api/v1/user/newsignup'));
/*request.body = json.encode(
    bodydata
  ); */
  Map <String, Object> datax = {
  "company_id": "1",
  "first_name": "Srikant",
  "last_name": "Mehta",
  "email": "ade1@gmail.com",
  "mobile": "7091266478",
  "mobile_prefix": "91",
  "user_type_id": "1",
  "password": "123456",
  "nationality": "101",
  "user_grade": "5",
  "newsletter_subscription": "1",
  "city_id": "707",
  "state_id": "10",
  "country_id": 101,
  "parent_id": "0"
};
request.body = json.encode(bodydata);
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}






        try {
          var headers = {
      'Content-Type': 'application/json'
    };

 String jsonBody = json.encode(bodydata);
  final encoding = Encoding.getByName('utf-8');

var  bodd = json.encode({
  "company_id": "1",
  "first_name": "Srikant",
  "last_name": "Mehta",
  "email": "ade1@gmail.com",
  "mobile": "7091266478",
  "mobile_prefix": "91",
  "user_type_id": "1",
  "password": "123456",
  "nationality": "101",
  "user_grade": "5",
  "newsletter_subscription": "1",
  "city_id": "707",
  "state_id": "10",
  "country_id": 101,
  "parent_id": "0"
});

      final response = await http.post(
        Uri.parse('https://api.bookingcabs.com:3001/api/v1/user/newsignup'),
        body: bodd,
    //encoding: encoding,
        //body: body,
      );

      if (response.statusCode == 200) {
          // Handle successful response
          print('Request success: Response: ${response.body}');
          return response;
       } else {
          // Handle error response
          print('Request failed: status: ${response.statusCode}');
          throw Exception('Failed');
       }
    } catch (e) {
       print('Request failed: exception message: ${e.toString()}');
       throw Exception('Failed');
    }
  }
*/


/*


Future<List<dynamic>?> getTrendingProductList() async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    Map<String, String> queryParams = {
      'username': 'mdsr2@gmail.com'
    };

    Uri uri = Uri.parse('$finalBaseURL$loginByEmailAPIName');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");
    var request = http.Request('POST', finalUri);


    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getTrendingProductList => Success is comming: ${value}');

      //var data = ProductsListResponse.fromJson(jsonDecode(value));

      //return data.products;
      Exception('Success');
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}



Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  print('data 01 ${response.reasonPhrase}');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response then parse the JSON.
    print('data 02 ${jsonDecode(response.body)}');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    print('data 03 ');
    throw Exception('Failed to load album');
  }
}



Future<ShopDetailsData> getShopDetailsData(String pageNameOrNo) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var headers2 = {
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
    };

    var urlx = '$baseURL_ADMIN/pages/$pageNameOrNo.json';
    print("httpRequest getShopDetailsData Request URL $urlx");

    var request = http.Request(
        'GET', Uri.parse('$baseURL_ADMIN//pages/$pageNameOrNo.json'));
    request.headers.addAll(headers2);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getShopDetailsData Response sucess: ${value}');

      var data = ShopDetailsData.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data;
    } else {
      print(
          'httpRequest getShopDetailsData Response: => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getShopDetailsData Response: => Error is comming: ${e}');
    throw Exception('Error');
  }
}



Future<List<ProductsListData>?> getTrendingProductList(String noOfItems) async {
  try {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Shopify-Access-Token': accessToken,
      authorizationKey: authorizationValue,
      'Cookie':
          '_secure_admin_session_id=21f7d0f18528aa29a62cf01e7068ac0e; _secure_admin_session_id_csrf=21f7d0f18528aa29a62cf01e7068ac0e'
    };

    Map<String, String> queryParams = {
      'sort_by': 'price-ascending',//'best-selling', price-ascending
      'status': 'active',
      'product_type': 'DISPOSABLE PODS', //'Disposable Pod Kit', //'DISPOSABLE PODS',
      'limit': '${noOfItems}',
      'vendor': '',
      'tag': 'Disposable Pod Kit'
    };

    Uri uri = Uri.parse('$baseURL_ADMIN/products.json?');
    final finalUri = uri.replace(queryParameters: queryParams); //USE THIS
    print("httpRequest getTrendingProductList Request URL $uri");
    var request = http.Request('GET', finalUri);


    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      print('httpRequest getTrendingProductList => Success is comming: ${value}');

      var data = ProductsListResponse.fromJson(jsonDecode(value));
      //print('response=> Success is xxx: ${data.products?.length}');

      return data.products;
    } else {
      print('httpRequest getTrendingProductList => Not success is comming: ');
      throw Exception('Failed');
    }
  } catch (e) {
    print('httpRequest getTrendingProductList => Error is comming: ${e}');
    throw Exception('Error');
  }
}



class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

*/




