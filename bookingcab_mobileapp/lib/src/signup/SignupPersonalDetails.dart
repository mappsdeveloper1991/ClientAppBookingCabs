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
  late String email, password;

  @override
  void initState() {
    super.initState();
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
       margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
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
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        style: textFormFieldStyle(),
        decoration: signupTextFormFieldDecoration(
            context, "Nationality", Icons.email_outlined),
      ),
    );
  }


  Widget _buildSignupButton() {
    return
      Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPVerification()),
              );
            },
            child: Text("Continue",
                style:buttonTextStyle(context,
                    Colors.white,MediaQuery.of(context).size.height / 40)),
          ),
        )
      ],
      ),
    );
  }
}
