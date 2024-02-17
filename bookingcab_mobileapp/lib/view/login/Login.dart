import 'dart:convert';
import 'dart:developer';

import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/dashboard/DashBoardPage.dart';
import 'package:bookingcab_mobileapp/view/home/HomeTabScreen.dart';
import 'package:bookingcab_mobileapp/view/login/loginResponseData.dart';
import 'package:bookingcab_mobileapp/view/otp/OTPVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import '../../AppStyle/AppUIComponent.dart';
import '../signup/SignupPersonalDetails.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String verificationType = "Password";
   String email = "", password = "", strOTP = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> loginwithEmailOrPhoneWithPassword(BuildContext context) async {
    if(email.isEmpty || email.length <= 5){
      showErrorTost(context, INVALID_EMAIL_MSG);
    }else if(password.isEmpty || password.length <=4){
        showErrorTost(context, INVALID_PASSWORD_MSG);
    }else{
      Map<String, Object> queryParams = {
        "username": email,
        "password": password,
        "sms_send_status": "false",
        "ip": "1.0.1.0",
        "lat": "00.00",
        "log": "00.00",
        "login_location": "E City, BLR - 560100",
        "callfrom": "MobileApp",
        "user_type_id": "1,2,6,7,8"
      };
      try {
        var  response =
            await postRequest(API_LOGIN_EMAIL_MOBILE_WITH_PASSWORD, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = LoginResponseData.fromJson(jsonData['responsedata']);
          if (responseData.status == SUCCESS_STATUS) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            showSuccessTost(context, responseData.error ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          showErrorTost(context, SOMETHING_WENT_WRONG_MSG);
        }
      } catch (e) {
        print('Exception occurred: $e');
        showErrorTost(context, SOMETHING_WENT_WRONG_MSG);
      }
    }
  }

  Future<void> loginGetOTP() async {
     if(email.isEmpty || email.length <= 5){
      showErrorTost(context, INVALID_EMAIL_MSG);
    }else{
      Map<String, Object> queryParams = {
        "username": email,
        "password": password,
        "sms_send_status": "false",
        "ip": "1.0.1.0",
        "lat": "00.00",
        "log": "00.00",
        "login_location": "E City, BLR - 560100",
        "callfrom": "MobileApp",
        "user_type_id": "1,2,6,7,8"
      };
      try {
        final response = await postRequest(newSignUpEndPoint, queryParams);
        if (response.statusCode == 200) {
          // Handle successful response
          print('Response: ${response.body}');
        } else {
          // Handle error response
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle exceptions
        print('Exception occurred: $e');
      }
    }
  }

  Future<void> loginWithVerifyOTP(String otp) async {
     if(email.isEmpty || email.length <= 5){
      showErrorTost(context, INVALID_EMAIL_MSG);
    }
    else if(otp.isEmpty || otp.length <=4){
        showErrorTost(context, INVALID_OTP_MSG);
    }
    else{
      Map<String, Object> queryParams = {
        "username": email,
        "password": password,
        "sms_send_status": "false",
        "ip": "1.0.1.0",
        "lat": "00.00",
        "log": "00.00",
        "login_location": "E City, BLR - 560100",
        "callfrom": "MobileApp",
        "user_type_id": "1,2,6,7,8"
      };
      try {
        final response = await postRequest(newSignUpEndPoint, queryParams);
        if (response.statusCode == 200) {
          // Handle successful response
          print('Response: ${response.body}');
        } else {
          // Handle error response
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle exceptions
        print('Exception occurred: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: simpleHeaderBar(context, "Login"),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.7,
                // width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
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
                  // _buildLogo(),
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
            //  height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.97,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              verificationType = "Password";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: verificationType == "Password"
                                ? buttonPrimaryColor
                                : whiteColor,
                            shape: RoundedRectangleBorder(),
                            elevation: 5.0,
                          ),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: verificationType == "Password"
                                  ? whiteColor
                                  : buttonPrimaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 60.0), // Adjust spacing as needed
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              verificationType = "OTP";
                            });
                            // Add your action for the red button
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: verificationType != "Password"
                                  ? buttonPrimaryColor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(),
                              elevation: 5.0),
                          child: Text(
                            'OTP',
                            style: TextStyle(
                              color: verificationType != "Password"
                                  ? Colors.white
                                  : buttonPrimaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                if (verificationType.contains("OTP"))
                  _otpView(context)
                else
                  _buildPasswordRow(),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                              if(verificationType == "Password"){
                                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignupPersonalDetails()));
                              }else{
                                    loginGetOTP();
                              }
                           
                            // Add your action for the yellow button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonSecondaryColor,
                            shape: RoundedRectangleBorder(),
                            elevation: 5.0,
                          ),
                          child: Text(
                             verificationType == "Password"? 'NEW USER?' : "RE-SEND OTP",
                            style: TextStyle(
                              color: verificationType == "Password"
                                  ? whiteColor
                                  : whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0), // Adjust spacing as needed
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if(verificationType == "Password"){
                              loginwithEmailOrPhoneWithPassword(context);
                            }else{
                              loginWithVerifyOTP(strOTP);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonPrimaryColor,
                              shape: RoundedRectangleBorder(),
                              elevation: 5.0),
                          child:  Text(
                            verificationType == "Password" ? 'LOGIN' : "VERIFY OTP",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: _buildForgetPasswordButton(),
                ),

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
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 50,
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
        
          loginWithVerifyOTP(strOTP);
      /*  
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ); 
        */
      }, // end onSubmit
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //FlatButton(
        TextButton(
          onPressed: () {
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new ForgotPassword()));
          },
          child: Text(
            "Forgot Password?",
            style: buttonTextStyle(context, buttonPrimaryColor, 16),
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
          width: MediaQuery.of(context).size.width * 0.45,
          //margin: const EdgeInsets.only(bottom: 16),
          //child: RaisedButton(
          child: ElevatedButton(
            style: primaryButtonStyle(context, buttonPrimaryColor),
            onPressed: () {
              //loginAPICall();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OTPVerification()),
              );
            },
            child: Text("Login",
                style: buttonTextStyle(context, Colors.white, 16)),
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
          height: 50,
          width: MediaQuery.of(context).size.width * 0.45,
          //margin: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              style: primaryButtonStyle(context, buttonSecondaryColor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupPersonalDetails()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'New User',
                    style: /*TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),*/
                        buttonTextStyle(context, Colors.white, 16),
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
    return const Column(
      children: <Widget>[
        Text("hello"),
        if (true) Text("should not render if false"),
        Text("world")
      ],
    );
  }
}
