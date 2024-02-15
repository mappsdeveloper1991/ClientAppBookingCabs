import 'package:bookingcab_mobileapp/view/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/view/profile/ChangePassword.dart';
import 'package:bookingcab_mobileapp/view/profile/EditProfile.dart';
import 'package:flutter/material.dart';

import '../AppStyle/AppHeadreApp.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Kunal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "android1@bookingcabs.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "9871030690",
                  style: TextStyle(
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
                                  builder: (context) => EditProfile()),
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
        CircleAvatar(
          backgroundColor: buttonPrimaryColor,
          radius: 8,
          child: Icon(
            size: 10,
            Icons.check,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '$label',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
