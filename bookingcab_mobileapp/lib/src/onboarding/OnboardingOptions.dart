import 'package:bookingcab_mobileapp/src/login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppStyle/AppColors.dart';
import '../AppStyle/AppUIComponent.dart';
import '../dashboard/DashBoardPage.dart';
import '../signup/SignupPersonalDetails.dart';

class OnboardingOptions extends StatefulWidget {

  @override
  OnboardingOptionsState createState() => OnboardingOptionsState();
}

class OnboardingOptionsState extends State<OnboardingOptions> {
  @override
  void initState() {
    super.initState();
  }


  //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()), );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child:
      Stack(
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
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 400,
                  color: Colors.transparent,
                    child: Column(
                        children: <Widget>[
                            _buildLoginButton(),
                            _buildSignUpBtn()
                          ]
                    ),
                ),
              )
          ),
        ],
      ),
    );
  }


  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 60, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: primaryButtonStyle(context, buttonSecondaryColor),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
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
          height: 60,
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              style:  secondaryButtonStyle(context, buttonPrimaryColor),
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SignupPersonalDetails()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Create an account',
                    style:
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