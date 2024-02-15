import 'dart:async';

import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageSelectionScreen.dart';
import 'package:bookingcab_mobileapp/view/login/Login.dart';
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
                  alignment: Alignment.center,
                  child:     Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bookingcbas_logo.png'),
                      ),
                    ),
                  ),
              )

            ),
          ],
        ),
    );
  }


  var isLoginOrNot = true;
  void isLanguageSelctedOrNot() {
    if (isLoginOrNot) {
      loadNavigateTolanguageSelectionPage();
    } else {
      loadNavigateToHomepgae();
    }
  }



  void loadNavigateTolanguageSelectionPage() {
    Timer(const Duration(seconds: 2),
            () =>
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => const LanguageSelectScreen())));
  }

  void loadNavigateToHomepgae() {
    Timer(const Duration(seconds: 2),
            () =>
        //Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => HomeScreen()),)
        Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => LoginPage()),)
    );
  }
}