import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppUIComponent.dart';
import 'package:bookingcab_mobileapp/view/login/Login.dart';
import 'package:flutter/material.dart';

class ThankyouScreen extends StatefulWidget {
  const ThankyouScreen({super.key});

  @override
  ThankyouScreenState createState() => ThankyouScreenState();
}

class ThankyouScreenState extends State<ThankyouScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/bookingcbas_logo.png"),
            // height: 70, // Set the desired height
            //width: 70, // Set the desired width
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
          SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage("assets/images/ok_image.png"),
            height: 70, // Set the desired height
            width: 70, // Set the desired width
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
          SizedBox(
            height: 15,
          ),
          const Text(
            'Thank you for signing up with us.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
          _buildSignupButton(),
        ],
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
              height: 40, //1.4 * (MediaQuery.of(context).size.height / 20),
              width: MediaQuery.of(context).size.width * .5,
              margin: const EdgeInsets.only(bottom: 20),
              //child: RaisedButton(
              child: ElevatedButton(
                style: primaryButtonStyle(context, buttonSecondaryColor),
                onPressed: () {
                  //loginAPICall();
                   Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); 
                },
                child: Text(
                  "Continue",
                  style: buttonTextStyle(context, Colors.white, 12),
                ),
              ))
        ],
      ),
    );
  }
}
