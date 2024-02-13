import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../AppStyle/AppColors.dart';
import '../AppStyle/AppHeadreApp.dart';
import '../AppStyle/AppUIComponent.dart';
import '../dashboard/DashBoardPage.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late String email, password;

  @override
  void initState() {
    super.initState();
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
/*          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              }
          );*/
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
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
