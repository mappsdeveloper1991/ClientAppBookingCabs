import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppUIComponent.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/forgotpassword/ForgotPasswordGetOTPResponseData.dart';
import 'package:bookingcab_mobileapp/view/forgotpassword/ForgotPasswordVerityOTPChangePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../AppStyle/AppHeadreApp.dart';

class ForgotPasswordGetOTP extends StatefulWidget {
  const ForgotPasswordGetOTP({super.key});

  @override
  State<ForgotPasswordGetOTP> createState() => _ForgotPasswordGetOTPState();
}

class _ForgotPasswordGetOTPState extends State<ForgotPasswordGetOTP> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

late String email = "";
late String userID = "";



Future<void> forgotPasswordGetOTP() async {
     if(email.isEmpty || email.length <= 5){
      showErrorTost(context, INVALID_EMAIL_MSG);
    }else{
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "username": email,
        "callfrom": "MobileApp",
        "user_type_id": "1"
      };
      try {
        final response = await postRequest(forGotPasswordEndPointGetOTP, queryParams);
        if (response.statusCode == 200) {
         print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = ForgotPasswordGetOTPResponseData.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
             userID = (responseData.data!.userId).toString();
              showSuccessTost(context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
                    Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordVerityOTPChangePassword(email, userID)),
            );

          }else{
               showErrorTost(context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        }
      } catch (e) {
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, "Forgot Password"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 20, bottom: 20),
              child: Column(
                children: [
                  
                  _buildEmailRow(),
                  
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonPrimaryColor,
                        shape: const RoundedRectangleBorder(),
                        elevation: 5.0,
                      ),
                      onPressed: () {
                            forgotPasswordGetOTP();
                      },
                      child: const Text(
                        'Get OTP',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
  
}