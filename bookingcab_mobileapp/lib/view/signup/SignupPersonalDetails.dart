import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppStyle/AppColors.dart';
import '../AppStyle/AppHeadreApp.dart';
import '../AppStyle/AppUIComponent.dart';
import '../dashboard/DashBoardPage.dart';
import '../otp/OTPVerification.dart';

class SignupPersonalDetails extends StatefulWidget {
  const SignupPersonalDetails({Key? key}) : super(key: key);

  @override
  _SignupPersonalDetailsState createState() => _SignupPersonalDetailsState();
}

class _SignupPersonalDetailsState extends State<SignupPersonalDetails> {
  late String firstName = "", lastName ="", emailID = "", mobileNo = "", referBy = "", password = "", confirmPassword = "", citys ="", nationality ="";

  @override
  void initState() {
    super.initState();
  }


Future<void> signUpAPICall() async {
    Map<String, String> queryParams = {
      "user_type_id": "1",
      "company_id": "1",
      "user_grade": "5",
      "newsletter_subscription": "1",
      'first_name': firstName,
      "last_name": lastName,
      "email": emailID,
      "mobile_prefix": "91",
      "mobile": mobileNo,
      "city_id" : "707",
      "state_id": "10",
      "country_id": "101",
      "parent_id" :"0"
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
                    _buildCitydRow(),
                    _buildNationalityRow(),
                    _buildSignupButton()
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
            citys = value;
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
                signUpAPICall();
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
