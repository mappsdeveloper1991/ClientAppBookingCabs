// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/profile/ChangePassword.dart';
import 'package:bookingcab_mobileapp/view/profile/EditProfile.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccountResponseData.dart';
import 'package:flutter/material.dart';

import '../../AppStyle/AppHeadreApp.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  UserProfileData? userProfileData = null;
  @override
  void initState() {
    super.initState();
    getProfileInfoAPICall();
  }

  Future<void> getProfileInfoAPICall() async {
    //showCustomeLoader(context);
    try {
      final response = await getRequest(userProfileInforEndPOint);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            MyAccountResponseData.fromJson(jsonData['responsedata']);
        // hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            userProfileData = responseData.data!;
            userProfileInfoData = userProfileData;
          });
        } else {
          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
        }
      } else {
        // Handle error response
        //hideCustomeLoader(context);
        //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      //hideCustomeLoader(context);
      showErrorTost(context, SOMETHING_WENT_WRONG_MSG);
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //getProfileInfoAPICall();

    return Scaffold(
      appBar: simpleHeaderBar(context, "My Account"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
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
                  height: 10,
                ),
                Text(
                  userProfileData?.firstName ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userProfileData?.email ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userProfileData?.mobile ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonSecondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 5.0,
                          ),
                          child: const Text(
                            'Change Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7.0), // Adjust spacing as needed
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your action for the red button

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfile(userProfileData!)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 5.0),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
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
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Advantages",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      _advantageWidget(
                        label: "Easy Payment",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _advantageWidget(
                        label: "Track Your Booking",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _advantageWidget(
                        label: "Instant Checkout",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      children: [
                        _accountWidget(
                          icon: Icons.settings,
                          label: "My Settings",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _accountWidget(
                          icon: Icons.wallet,
                          label: "Refer and Earn",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _accountWidget(
                          icon: Icons.share,
                          label: "Share the App",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _accountWidget(
                          icon: Icons.star,
                          label: "Review Us",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _accountWidget(
                          icon: Icons.airport_shuttle,
                          label: "About Us",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _accountWidget extends StatelessWidget {
  const _accountWidget({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: buttonPrimaryColor,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.chevron_right,
          color: Colors.grey,
          size: 30,
        )
      ],
    );
  }
}

class _advantageWidget extends StatelessWidget {
  const _advantageWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: buttonPrimaryColor,
          radius: 8,
          child: Icon(
            size: 10,
            Icons.check,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
