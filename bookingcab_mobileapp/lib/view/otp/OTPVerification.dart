import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/login/GetOTPResponseData.dart';
import 'package:bookingcab_mobileapp/view/login/VerifyOTPResponseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import '../../AppStyle/AppUIComponent.dart';
import '../dashboard/DashBoardPage.dart';

class OTPVerification extends StatefulWidget {
  /*
    String email = "", userID = "", strOTP = "";

  const OTPVerification(this.email, this.userID, {Key? key}) : super(key: key);
*/
  final String emailID;
  final String userID;

  const OTPVerification(this.emailID, this.userID, {Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late String emailID = widget.emailID;
  late String userID = widget.userID;
  late String strOTP = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> loginGetOTP() async {
    if (emailID.isEmpty || emailID.length <= 5) {
      showErrorTost(context, INVALID_EMAIL_MSG);
    } else {
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "username": emailID,
        "callfrom": "MobileApp",
        "user_type_id": "1"
      };
      try {
        final response =
            await postRequest(loginByEmailAPINameGetOTP, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData =
              GetOTPResponseData.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
            userID = (responseData.data![0].userId).toString();
            showSuccessTost(
                context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
          } else {
            showErrorTost(
                context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        }
      } catch (e) {
        // Handle exceptions
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        hideCustomeLoader(context);
        print('Exception occurred: $e');
      }
    }
  }

  Future<void> loginWithVerifyOTP(String otp) async {
    if (userID.isEmpty) {
      showErrorTost(context, "Invalid user id");
    } else if (otp.isEmpty || otp.length <= 4) {
      showErrorTost(context, INVALID_OTP_MSG);
    } else {
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "user_id": userID,
        "confirm_otp": otp,
        "callfrom": "MobileApp",
      };
      try {
        final response = await postRequest(Verify_OTP, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData =
              VerifyOTPResponseData.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
            showSuccessTost(
                context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            showSuccessTost(
                context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleHeaderBar(context, "OTP Verification"),
        backgroundColor: whiteColor,
        body: Container(
            margin: EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    _otpView(context),
                    const SizedBox(height: 30),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Time Remaining : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        TextSpan(
                          text: '18',
                          style: TextStyle(
                            color: buttonPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildVerifyOtpButton(),
                        ),
                        Expanded(
                          child: _buildReSendOtpButton(),
                        )
                      ],
                    ),
                  ]),
            )));
  }

  OtpTextField _otpView(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,

      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      fieldWidth: 60,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        strOTP = verificationCode;
        loginWithVerifyOTP(strOTP);
/*          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              }
          );*/

        /*  Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        ); */
      }, // end onSubmit
    );
  }

  Widget _buildVerifyOtpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: MediaQuery.of(context).size.width * 0.44,
          //margin: const EdgeInsets.only(bottom: 20),
          //child: RaisedButton(
          child: ElevatedButton(
              style: primaryButtonStyle(context, buttonSecondaryColor),
              onPressed: () {
                //loginAPICall();
                loginWithVerifyOTP(strOTP);
                /*
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ); */
              },
              child: Text("VERIFY OTP",
                  style: buttonTextStyle(context, Colors.white, 15))),
        )
      ],
    );
  }

  Widget _buildReSendOtpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: MediaQuery.of(context).size.width * 0.44,
          //margin: const EdgeInsets.only(bottom: 20),
          //child: RaisedButton(
          child: ElevatedButton(
            style: primaryButtonStyle(context, buttonPrimaryColor),
            onPressed: () {
              //loginAPICall();
              loginGetOTP();
              /*  Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              */
            },
            child: Text(
              "RE-SEND OTP",
              style: buttonTextStyle(context, Colors.white, 16),
            ),
          ),
        )
      ],
    );
  }
}
