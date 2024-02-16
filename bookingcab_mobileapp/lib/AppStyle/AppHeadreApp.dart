import 'package:flutter/material.dart';

import '../view/dashboard/DashBoardPage.dart';
import 'AppColors.dart';

AppBar languageSelectionHeaderBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 2,
      title: //Text("Home Page"),
          const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/bookingcbas_logo.png"),
          )
          //bookingCabsTextLogo(context),
        ],
      ),
      //centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: EdgeInsetsDirectional.only(end: 0),
            //height: 150.0,
            //width: 40.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                "SKIP",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ]);
}

AppBar simpleHeaderBar(BuildContext context, String pageTitle) {
  return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: primaryColor,
      elevation: 2,
      title: Text(pageTitle),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.chevron_left_outlined),
        //tooltip: 'Open shopping cart',
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
      actions: const <Widget>[]);
}

RichText bookingCabsTextLogo(BuildContext context) {
  return RichText(
    text: const TextSpan(
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: "Book",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: "ing",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        TextSpan(
          text: "cabs",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}

ColoredBox languageSelectionHeader(BuildContext context) {
  return ColoredBox(
    color: const Color(0xFFF9DDA4),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: "Book",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "ing",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
                TextSpan(
                  text: "cabs",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
