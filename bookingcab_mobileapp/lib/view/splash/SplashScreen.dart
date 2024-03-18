import 'dart:async';
import 'dart:convert';

import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/localDB/SharedPreferencesUtil.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/booking_history/MapSample.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageSelectionScreen.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccountResponseData.dart';
import 'package:flutter/material.dart';

import '../dashboard/DashBoardPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLanguageSelctedOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login_bg_img.jpeg'),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bookingcbas_logo.png'),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Future<void> isLanguageSelctedOrNot() async {
    //var pre = SharedPreferencesUtil.init();
    var isLoginOrNot = await SharedPreferencesUtil.isLogin();
    print("isLanguageSelctedOrNot: $isLoginOrNot");
    if (!isLoginOrNot) {
      loadNavigateTolanguageSelectionPage();
    } else {
      USER_ID = await SharedPreferencesUtil.getDataBykey(
          SharedPreferencesUtil.KEY_USER_ID);
      await getProfileInfoAPICall();
      loadNavigateToHomepgae();
    }
  }

  void loadNavigateTolanguageSelectionPage() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LanguageSelectScreen())));
               // builder: (context) =>  MapScreen())));
  }

  void loadNavigateToHomepgae() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            )
        //Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => LoginPage()),)
        );
  }

  Future<void> getProfileInfoAPICall() async {
    //showCustomeLoader(context);
    try {
      final response = await getRequest(userProfileInforEndPOint);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            MyAccountResponseData.fromJson(jsonData['responsedata']);
        // hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          userProfileInfoData = responseData.data!;
          USER_ID = userProfileInfoData!.userId.toString();
          USER_FIRST_NAME = userProfileInfoData!.firstName!;
          USER_LAST_NAME = userProfileInfoData!.lastName!;
          USER_EMAIL_ID = userProfileInfoData!.email!;
          USER_MOBILE_PREFIX = userProfileInfoData!.mobilePrefix!;
          USER_MOBILE_NO = userProfileInfoData!.mobile!;
          USER_IS_ACTIVE = userProfileInfoData!.isActive.toString();
          USER_SIGNUP_STATUS = await SharedPreferencesUtil.getDataBykey(
              SharedPreferencesUtil.KEY_USER_SIGNUP_STATUS);
          COUNTRY_ID = userProfileInfoData!.companyId.toString();
          USER_TOCKEN = await SharedPreferencesUtil.getDataBykey(
              SharedPreferencesUtil.KEY_USER_TOCKEN);
          USER_GRADE = userProfileInfoData!.userGrade!;
          USER_TYPE_ID = userProfileInfoData!.userTypeId.toString();
          COMPANY_ID = userProfileInfoData!.companyId.toString();
          SharedPreferencesUtil.saveUserProfileData(
              USER_ID,
              USER_FIRST_NAME,
              USER_LAST_NAME,
              USER_EMAIL_ID,
              USER_MOBILE_PREFIX,
              USER_MOBILE_NO);
        } else {
          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
        }
      } else {
        // Handle error response
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      //hideCustomeLoader(context);
      print('Exception occurred: $e');
    }
  }
}
