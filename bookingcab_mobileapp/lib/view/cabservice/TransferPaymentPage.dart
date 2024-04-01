import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppUIComponent.dart';
import 'package:bookingcab_mobileapp/view/dashboard/DashBoardPage.dart';
import 'package:flutter/material.dart';

class TransferPaymentPage extends StatefulWidget {
  const TransferPaymentPage({super.key});

  @override
  TransferPaymentPageState createState() => TransferPaymentPageState();
}

class TransferPaymentPageState extends State<TransferPaymentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getProfileInfoAPICall();

    return Scaffold(
        appBar: simpleHeaderBar(context, "Payment Details"),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey, // specify the border color
                      width: 2.0, // specify the border width
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 70,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 140,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textLabel(context, "Name"),
                      textViewValue(context, "Mohit Verma"),
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textLabel(context, "Mobile No"),
                      textViewValue(context, "+91 8130740896"),
                    ],
                  ),

                   SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textLabel(context, "Total Distance"),
                      textViewValue(context, "24 KM"),
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textLabel(context, "Tax"),
                      textViewValue(context, "INR 150/-"),
                    ],
                  ),

                   SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textLabel(context, "Total Ammount"),
                      textViewValue(context, "INR 1470"),
                    ],
                  ),

                 
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  _buildSignupButton()
                ]))
          ]),
        ])));
  }

  Container textViewValue(BuildContext context, String labVal) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Text(
          "$labVal",
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: blackColor),
        ));
  }

  Container textLabel(BuildContext context, String labelVal) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.30,
        child: Text(
          "$labelVal :",
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: blackColor),
        ));
  }

  Widget _buildSignupButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 40, //1.4 * (MediaQuery.of(context).size.height / 20),
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.only(bottom: 20),
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
                  "Ok",
                  style: buttonTextStyle(
                    context,
                    Colors.white,
                    16,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
