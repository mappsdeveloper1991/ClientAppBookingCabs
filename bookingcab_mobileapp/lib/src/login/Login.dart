import 'dart:developer';

import 'package:bookingcab_mobileapp/src/dashboard/DashBoardPage.dart';
import 'package:bookingcab_mobileapp/src/home/HomeTabScreen.dart';
import 'package:flutter/material.dart';
import '../AppStyle/AppColors.dart';
import '../AppStyle/AppUIComponent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            'assets/images/ic_launcher.png',
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
            height: MediaQuery.of(context).size.height * 0.6,
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
                      height: 30,
                      child: Text(""),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
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
          height: 45, //1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20),
          //child: RaisedButton(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(blackColor),
            ),
            onPressed: () {
              //loginAPICall();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text("Login",
                style: /*TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),*/
                    buttonTextStyle(context, Colors.white,
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
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => new SignUp()));
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
                        buttonTextStyle(context, Colors.black,
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
