import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/profile/ChangesPasswordResponseData.dart';
import 'package:flutter/material.dart';

import '../../AppStyle/AppHeadreApp.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

late String userID = '', oldPassword = '', newPassword = '', newConfirmPassword = '';

Future<void> chnagePasswordAPICall() async {
    oldPassword = _oldPasswordController.text.toString();
    newPassword  = _newPasswordController.text.toString();
    newConfirmPassword  = _confirmPasswordController.text.toString();
    if (oldPassword.isEmpty) {
      showErrorTost(context, INVALID_OLD_PASSWORD_MSG);
    } else if (newPassword.isEmpty || newPassword.length < 4) {
      showErrorTost(context, INVALID_CONFIRM_PASSORD_MSG);
    }else if (newConfirmPassword.isEmpty || newConfirmPassword.length < 4) {
      showErrorTost(context, INVALID_PASSWORD_MSG);
    } else if (newPassword != newConfirmPassword) {
      showErrorTost(context, INVALID_PASSWORD_CONFIRM_PASSWORD_MSG);
    }
    else{
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
        "id": userID,
        "oldpass": oldPassword,
        "newpass": newPassword,
        "cpass": newConfirmPassword,
        "callfrom": "MobileApp",
      };
      try {
        final response = await postRequest(accountChangePassword, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = ChangesPasswordResponseData.fromJson(jsonData['response']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
              showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
               Navigator.pop(context);
          }else{
               showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
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
      appBar: simpleHeaderBar(context, "Change Password"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Change Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 20, bottom: 20),
              child: Column(
                children: [
                  _buildTextField("Old Password", _oldPasswordController),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField("New Password", _newPasswordController),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                      "Confirm Password", _confirmPasswordController),
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
                        chnagePasswordAPICall();
                      },
                      child: const Text(
                        'Next Step',
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
      ),
    );
  }
}
