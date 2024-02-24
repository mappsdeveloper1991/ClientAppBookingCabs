// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/signup/CityAPIResponseData.dart';
import 'package:bookingcab_mobileapp/view/signup/NationalityAPIResponseData.dart';
import 'package:bookingcab_mobileapp/view/signup/SignupResponseData.dart';
import 'package:flutter/material.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import '../../AppStyle/AppUIComponent.dart';
import '../otp/OTPVerification.dart';

class SignupPersonalDetails extends StatefulWidget {
  const SignupPersonalDetails({Key? key}) : super(key: key);

  @override
  _SignupPersonalDetailsState createState() => _SignupPersonalDetailsState();
}

class _SignupPersonalDetailsState extends State<SignupPersonalDetails> {
  late String firstName = "",
      lastName = "",
      emailID = "",
      mobileNo = "",
      referBy = "",
      password = "",
      confirmPassword = "",
      city = "707",
      stateID = "10",
      nationality = "101";

  @override
  void initState() {
    super.initState();

    getNationaListAPICall("Ind");
  }

  Future<void> signUpAPICall(BuildContext context) async {
    if (firstName.isEmpty) {
      showErrorTost(context, INVALID_FIRST_NAME_MSG);
    } else if (lastName.isEmpty) {
      showErrorTost(context, INVALID_LAST_NAME_MSG);
    } else if (emailID.isEmpty) {
      showErrorTost(context, INVALID_EMAIL_ID_MSG);
    } else if (password.isEmpty) {
      showErrorTost(context, INVALID_PASSWORD_MSG);
    } else if (confirmPassword.isEmpty) {
      showErrorTost(context, INVALID_CONFIRM_PASSORD_MSG);
    } else if (password != confirmPassword) {
      showErrorTost(context, INVALID_PASSWORD_CONFIRM_PASSWORD_MSG);
    } else if (city.isEmpty) {
      showErrorTost(context, INVALID_CITY_MSG);
    } else if (nationality.isEmpty) {
      showErrorTost(context, INVALID_NATIONALITY_MSG);
    } else {
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "first_name": firstName,
        "last_name": lastName,
        "email": emailID,
        "mobile": mobileNo,
        "password": password,
        "mobile_prefix": "91",
        "city_id": city,
        "state_id": "10",
        "country_id": nationality,
        "nationality": nationality,
        "user_type_id": "1",
        "user_grade": "5",
        "newsletter_subscription": "1",
        "parent_id": "0",
        "company_id": "1"
      };

      try {
        final response = await postRequest(newSignUpEndPoint, queryParams);
        if (response.statusCode == 200) {
          // Handle successful response
          print('Response: ${response.body}');

          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData =
              SignupResponseData.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
            if (responseData.data!.status == SUCCESS_STATUS) {
              showSuccessTost(
                  context,
                  responseData.data!.message +
                      "\n " +
                      responseData.data!.emailMessage);

              String userID = responseData.data!.userId.toString();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => OTPVerification(emailID, userID)),
              );
            } else {
              showErrorTost(context, responseData.data!.message);
            }
          }
        } else {
          // Handle error response
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
    }
  }

  late List<NationalityList> nationalityList = [];
  late List<City> cityList = [];

  Future<List<NationalityList>> seachNationality(String query) async {
    getNationaListAPICall(query);
    return await Future.delayed(const Duration(seconds: 1), () {
      return nationalityList.where((e) {
        return e.nationality.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<List<City>> seachCity(String query) async {
    getCityListAPICall(query);
    return await Future.delayed(const Duration(seconds: 1), () {
      return cityList.where((e) {
        return e.cityStateCountry.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> getCityListAPICall(String query) async {
    String cityName = query;
    showCustomeLoader(context);
    try {
      final response = await getRequest('$CITY_API_END_POINT$cityName');
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData = CityAPIResponseData.fromJson(jsonData['response']);
        hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            cityList = responseData.data;
          });
        } else {
          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
        }
      } else {
        // Handle error response
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      hideCustomeLoader(context);
      showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
      print('Exception occurred: $e');
    }
  }

  Future<void> getNationaListAPICall(String nationality) async {
    Map<String, Object> queryParams = {"nationality": nationality};
    //showCustomeLoader(context);
    try {
      final response =
          await postRequest(Nationality_API_END_POINT, queryParams);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            NationalityAPIResponseData.fromJson(jsonData['responsedata']);
        //hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            nationalityList = responseData.data;
          });
        } else {
          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
        }
      } else {
        // Handle error response
        //hideCustomeLoader(context);
        //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      //hideCustomeLoader(context);
      //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleHeaderBar(context, "Sign Up"),
        backgroundColor: whiteColor,
        body: Container(
            margin: EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildFirstNameRow(),
                    _buildLastNameRow(),
                    _buildEmailRow(),
                    _buildMobileNoRow(),
                    _buildReferByRow(),
                    _buildPasswordRow(),
                    _buildConfirmPasswordRow(),
                    //_buildCitydRow(),
                    //_buildNationalityRow(),
                    Container(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                            ),
                            borderRadius:
                                BorderRadius.circular(5), // Add rounded corners
                          ),
                          child: CustomDropdown<City>.searchRequest(
                            futureRequest: seachCity,
                            hintText: 'Search City',
                            items: cityList,
                            onChanged: (value) {
                              var vv = value.cityStateCountry.toString;
                              city = value.cityId.toString();
                              stateID = value.stateId.toString();
                              print('changing value to: $vv');
                            },
                          ),
                        )),
                    Container(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                            ),
                            borderRadius:
                                BorderRadius.circular(5), // Add rounded corners
                          ),
                          child: CustomDropdown<NationalityList>.searchRequest(
                            futureRequest: seachNationality,
                            hintText: 'Search Nationality',
                            items: nationalityList,
                            onChanged: (value) {
                              var vv = value.nationality.toString;
                              nationality = value.countryId.toString();
                              print('changing value to: $vv');
                            },
                          ),
                        )),
                    _buildSignupButton(),
                    Container(
                      height: 20,
                    ),
                  ]),
            )));
  }

  Widget _buildFirstNameRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            firstName = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "First Name", Icons.email_outlined),
      ),
    );
  }

  Widget _buildLastNameRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            lastName = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Last Name", Icons.email_outlined),
      ),
    );
  }

  Widget _buildEmailRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            emailID = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "E-mail", Icons.email_outlined),
      ),
    );
  }

  Widget _buildMobileNoRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {
            mobileNo = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "MobileNo", Icons.email_outlined),
      ),
    );
  }

  Widget _buildReferByRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            referBy = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Refer By", Icons.email_outlined),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Password", Icons.email_outlined),
      ),
    );
  }

  Widget _buildConfirmPasswordRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value) {
          setState(() {
            confirmPassword = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Confirm Password", Icons.email_outlined),
      ),
    );
  }

  Widget _buildCitydRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            city = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "City", Icons.email_outlined),
      ),
    );
  }

  Widget _buildNationalityRow() {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            nationality = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Nationality", Icons.email_outlined),
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50, //1.4 * (MediaQuery.of(context).size.height / 20),
            width: MediaQuery.of(context).size.width * .9,
            margin: const EdgeInsets.only(bottom: 20),
            //child: RaisedButton(
            child: ElevatedButton(
              style: primaryButtonStyle(context, buttonSecondaryColor),
              onPressed: () {
                //loginAPICall();
                /*  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OTPVerification()),
                ); */
                signUpAPICall(context);
              },
              child: Text("Continue",
                  style: buttonTextStyle(context, Colors.white,
                      MediaQuery.of(context).size.height / 40)),
            ),
          )
        ],
      ),
    );
  }
}
