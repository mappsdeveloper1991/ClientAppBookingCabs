import 'package:bookingcab_mobileapp/view/AppStyle/AppColors.dart';
import 'package:flutter/material.dart';

import '../AppStyle/AppHeadreApp.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                        // Handle signup logic here
                        // You can access user inputs using _firstNameController.text, _lastNameController.text, etc.
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
