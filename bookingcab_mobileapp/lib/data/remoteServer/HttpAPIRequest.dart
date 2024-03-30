// ignore_for_file: non_constant_identifier_names, constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;

import '../localDB/GlobalValue.dart';

//const userID = 'https://api.bookingcabs.com:3001/api/v1/city/fetchNationality';

const String baseURL = "https://api.bookingcabs.com";
const String portNo = ":3001";
const String subURL = "/api/v1/";
const String subURLUser = "user/";
const String subURLActivation = "activation/";

const String finalBaseURL = "$baseURL$portNo$subURL";



const String API_LOGIN_EMAIL_MOBILE_WITH_PASSWORD = "${subURLUser}login";
const String loginByEmailAPINameGetOTP = "${subURLUser}getuserbyusername";
const String newSignUpEndPoint = "${subURLUser}newsignup";
const String Verify_OTP = "${subURLActivation}fetchOtp";

const String forGotPasswordEndPointGetOTP = "${subURLUser}forgotuserpassword";
const String forGotPasswordEndPointVerifyOTP = "${subURLUser}changeuserpassword";
const String accountChangePassword = "${subURLUser}changePassword";

String userProfileInforEndPOint = "${subURLUser}userpersonalinfo?user_id=$USER_ID";

const String Update_Signup_Infor_API = "${subURLUser}updatepersonalinfo";
const String UPADTE_COMPANY_END_POINT = "company/addcompany";

const String LanguageAPI_END_POINT = "master-language";

const String Nationality_API_END_POINT = "city/fetchNationality";

const String CITY_API_END_POINT = "city/stateCountryByCityName?city_name=";
const String CITY_PACKAGE_LIST_POINT = "city/packageCity";

const String OneWayPackageList_API_ENDPOINT_NAME ="lowest_fare_wrapper/getLowestFareList";
const String THING_TO_DO_API_ENDPOINT_NAME = "sightseeing/listsightseeing";

const String BOOKING_LIST_API_ENDPOINT_NAME = "booking/bookingListSearch?access_token=";



const String TRANSFAR_CITY_LIST = "https://bookingcabs.com:3001/api/v1/city/packageCity?term="; //term is options 
const String TRANSFER_AIRPORT_STATION_LIST = "airport-railway/masterairport"; //{ "city_id": "707" }
const String TRANSFER_LOCATION_NAME = "location/getLocationData"; //{ "area": "optional", "city_id": "707" }
const String TRANSFER_LOCATION_ADDRESS = "address/getAddressData"; // { "address": "new delhi", "city_id": "707" }

const String GET_TRANSFER_VEHICEL_LIST = "fare_wrapper/get_data_from_booking_fare_data";


const String SUCCESS_STATUS = "success";
const String FAILED_STATUS = "failed";
const String SOMETHING_WENT_WRONG_MSG = "Something went wrong please try again";
const String INVALID_EMAIL_MSG =
    "Please enter the valid email id or mobile number";
const String INVALID_PASSWORD_MSG = "Please enter the valid password";
const String INVALID_OLD_PASSWORD_MSG = "Please enter the valid old password";
const String INVALID_OTP_MSG = "Please enter the valid OTP";
const String INVALID_FIRST_NAME_MSG = "Please enter your first name";
const String INVALID_LAST_NAME_MSG = "Please enter your last name";
const String INVALID_EMAIL_ID_MSG = "Please enter the valid email id";
const String INVALID_ALT_EMAIL_ID_MSG =
    "Please enter the valid alternate email id";
const String INVALID_PHONE_NO_MSG = "Please enter the valid mobile no";
const String INVALID_ALT_PHONE_NO_MSG =
    "Please enter the valid alternate mobile no";
const String INVALID_LANDINE_NO_MSG = "Please enter the valid landline no";
const String INVALID_ALT_HONE_NO_MSG =
    "Please enter the valid alternate mobile no";
const String INVALID_CONFIRM_PASSORD_MSG = "Please enter the valid password";
const String INVALID_PASSWORD_CONFIRM_PASSWORD_MSG =
    "Password and confirm password should be same";
const String INVALID_CITY_MSG = "Please slect your city";
const String INVALID_NATIONALITY_MSG = "Please slect your nationality";
const String INVALID_COMAPNY_NAME_MSG = "Please enter your company name";

const String INVALID_COMAPNY_GST_NO_MSG = "Please enter your company GST No";
const String INVALID_COMAPNY_Office_Address_MSG =
    "Please enter your company office address";
const String INVALID_COMAPNY_PAN_MSG = "Please enter your company PAN Card No";
const String INVALID_COMAPNY_Aadhar_MSG =
    "Please enter your company Aadhar card no";
const String INVALID_COMAPNY_CONTACT_PERSONAL_NAME_MSG =
    "Please enter your company contact persion name";
const String INVALID_COMAPNY_URL_MSG = "Please enter your company website url";
const String INVALID_PIN_CODE = 'Plesae enter the valid PIN Code';


const String SELECET_CITY_NAME = "Seleect your city";
const String SELECT_AIRPORT_RAILWAY = "Select Airport or Railway station";
const String FLIGHT_TRAIN_NO = "Eenter your flight or train number";
const String SELECT_PICKUP_LOCATION = "Select your pickup or drop location";
const String SELECT_PICKUP_LANDMARK = "Select your pickup or drop landmark";
const String SELECT_PICKUP_Address = "Select your pickup or drop Address";


// Method for making GET requests
Future<http.Response> getRequest(String endpoint) async {
  try {
    String APIURL = '$finalBaseURL/$endpoint';
    print('API Request ApiURL: $APIURL ');

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

// Method for making GET requests
Future<http.Response> getRequestFullURL(String APIURL) async {
  try {
   // String APIURL = '$finalBaseURL/$endpoint';
    print('API Request ApiURL: $APIURL ');

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
Future<http.Response> postRequest(
    String apiEndPointName, Map<String, Object> bodydata) async {
  try {
    String APIURL = '$finalBaseURL$apiEndPointName';
    print('API Request ApiURL: $APIURL    bodyData: $bodydata');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.post(
      Uri.parse(APIURL),
      headers: headers,
      body: json.encode(bodydata),
    );

    //print('API Request Response: response: ${response}');
    if (response.statusCode == 200) {
      print('API Request Response: success: Data: ${response.body}');
      // Handle the response data here
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
