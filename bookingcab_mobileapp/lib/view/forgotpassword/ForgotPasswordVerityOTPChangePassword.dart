import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppUIComponent.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/forgotpassword/ForgotPasswordGetOTPResponseData.dart';
import 'package:bookingcab_mobileapp/view/login/Login.dart';
import 'package:bookingcab_mobileapp/view/login/VerifyOTPResponseData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../AppStyle/AppHeadreApp.dart';

class ForgotPasswordVerityOTPChangePassword extends StatefulWidget {
  final String emailID;
  final String userID;
  

  const ForgotPasswordVerityOTPChangePassword(this.emailID, this.userID, {Key? key}) : super(key: key);



  @override
  State<ForgotPasswordVerityOTPChangePassword> createState() => _ForgotPasswordVerityOTPChangePasswordState();
}

class _ForgotPasswordVerityOTPChangePasswordState extends State<ForgotPasswordVerityOTPChangePassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

    late String emailID = widget.emailID;
    late String userID = widget.userID;
     String strOTP = "";
     String passowrd = "";
     String confirmPassword = "";


Future<void> forgotPasswordGetOTP() async {
     if(emailID.isEmpty || emailID.length <= 5){
      showErrorTost(context, INVALID_EMAIL_MSG);
    }else{
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "username": emailID,
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


  Future<void> forgotPasswordWithVerifyOTP(String otp) async {
    passowrd = _newPasswordController.text.toString();
    confirmPassword = _confirmPasswordController.text.toString();
    if (passowrd.isEmpty) {
      showErrorTost(context, INVALID_PASSWORD_MSG);
    } else if (confirmPassword.isEmpty) {
      showErrorTost(context, INVALID_CONFIRM_PASSORD_MSG);
    } else if (passowrd != confirmPassword) {
      showErrorTost(context, INVALID_PASSWORD_CONFIRM_PASSWORD_MSG);
    }
    else if(otp.isEmpty || otp.length <=4){
        showErrorTost(context, INVALID_OTP_MSG);
    }
    else{
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "user_id": userID,
        "otp": otp,
        "new_password": passowrd,
        "confirm_password": confirmPassword,
        "callfrom": "MobileApp",
      };
      try {
        final response = await postRequest(forGotPasswordEndPointVerifyOTP, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = ForgotPasswordGetOTPResponseData.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
              showSuccessTost(context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
               Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          }else{
               showSuccessTost(context, responseData.msg ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          // Handle error response
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle exceptions
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
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Column(
                children: [
                  _buildTextField("Password", _newPasswordController),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildTextField(
                      "Confirm Password", _confirmPasswordController),
                  const SizedBox(
                    height: 15,
                  ),
                   _otpView(context),
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
                        forgotPasswordWithVerifyOTP(strOTP);
                      },
                      child: const Text(
                        'Submit',
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



  
  Widget _buildTextField(String labelText, TextEditingController controller) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.grey,
          ),
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
        ),
        onChanged: (value) => {

        },
      ),
    );
  }


  OtpTextField _otpView(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,

      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      fieldWidth: 60,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
         strOTP = verificationCode;
         forgotPasswordWithVerifyOTP(strOTP);
      }, // end onSubmit
    );
  }

}

