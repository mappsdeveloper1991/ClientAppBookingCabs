import 'package:bookingcab_mobileapp/view/login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppUIComponent.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            Positioned(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      scale: .5,
                      image: AssetImage(
                        'assets/images/bookingcbas_logo.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Your Safety Our Priority",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                color: Colors.transparent,
                child: Column(
                    children: <Widget>[_buildSignUpBtn(), _buildLoginButton()]),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: primaryButtonStyle(context, buttonPrimaryColor),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("Sign In",
                style: buttonTextStyle(context, Colors.white,
                    MediaQuery.of(context).size.height / 40)),
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
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 40,
            child: OutlinedButton(
              style: secondaryButtonStyle(context, buttonSecondaryColor),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupPersonalDetails()));
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Get Started',
                    style: buttonTextStyle(context, Colors.white,
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
