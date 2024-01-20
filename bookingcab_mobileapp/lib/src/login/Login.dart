import 'dart:developer';

import 'package:bookingcab_mobileapp/src/dashboard/DashBoardPage.dart';
import 'package:bookingcab_mobileapp/src/home/HomeTabScreen.dart';
import 'package:bookingcab_mobileapp/src/otp/OTPVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../AppStyle/AppColors.dart';
import '../AppStyle/AppUIComponent.dart';
import '../signup/SignupPersonalDetails.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String verificationType = "Password";
  late String email, password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  _buildLogo(),
                  _buildContainer(),
                  // _buildSignUpBtn(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            'assets/images/bookingcbas_logo.png',
            width: 300,
            height: 150,
            fit: BoxFit.contain,
            // height: 32,
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  // width: 200,
                  // height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 0,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 10,
                      child: Text(""),
                    ),
                  ],
                ),
                _buildEmailRow(),

                SegmentedButton<String>(

                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(
                        value: 'Password',
                        label: Text('Password'),
                        icon: Icon(Icons.calendar_view_day)),
                    ButtonSegment<String>(
                        value: 'OTP',
                        label: Text('OTP'),
                        icon: Icon(Icons.calendar_view_week)),
                  ],
                  selected: <String>{verificationType},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      verificationType = newSelection.first;
                    });

                      print("Segment Value: $newSelection  and verificationType:$verificationType");
                  },
                ),

                const SizedBox(height: 10),
                if (verificationType.contains("OTP"))
                   _otpView(context)
                else
                  _buildPasswordRow(),
                const SizedBox(height: 10),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildSignUpBtn(),
                //_buildOrRow(),
                //_buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        style: textFormFieldStyle(),
        decoration:
            textFormFieldDecoration(context, "E-mail", Icons.email_outlined),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        style: textFormFieldStyle(),
        decoration:
            textFormFieldDecoration(context, "Password", Icons.key_outlined),
      ),
    );
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

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //FlatButton(
        TextButton(
          onPressed: () {
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new ForgotPassword()));
          },
          child: Text(
            "Forgot Password",
            style: buttonTextStyle(context, blackColor, 16),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: MediaQuery.of(context).size.width * 0.70,
          margin: const EdgeInsets.only(bottom: 20),
          //child: RaisedButton(
          child: ElevatedButton(
            style: primaryButtonStyle(context, buttonSecondaryColor),
            onPressed: () {
              //loginAPICall();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OTPVerification()),
              );
            },
            child: Text("Login",
                style:buttonTextStyle(context,
                    Colors.white,MediaQuery.of(context).size.height / 40)),
          ),
        )
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 55,
          width: MediaQuery.of(context).size.width * 0.70,
          margin: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              style: primaryButtonStyle(context, buttonPrimaryColor),
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignupPersonalDetails()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Create an account',
                    style: /*TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),*/
                        buttonTextStyle(context, Colors.white,
                            MediaQuery.of(context).size.height / 40),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OTPORPassword extends StatelessWidget {
  const OTPORPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
/*    return Container(
      if (verificationType == "OTP") {
         _otpView(context);
      }else{
        _buildPasswordRow();
    }
   );*/
    return Column(children: <Widget>[
      Text("hello"),
      if (true)
        Text("should not render if false"),
      Text("world")
    ],);
  }
}
