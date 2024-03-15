// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageResponseData.dart';
import 'package:bookingcab_mobileapp/view/onboarding/OnboardingOptions.dart';
import 'package:flutter/material.dart';
import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import '../../AppStyle/AppUIComponent.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  String? selectedLanguage;
  late List<Language>? languageListData = [];

  @override
  void initState() {
    super.initState();
    // getLanguageListAPICall();
  }

  Future<void> getLanguageListAPICall() async {
    //showCustomeLoader(context);
    try {
      final response = await getRequest(LanguageAPI_END_POINT);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData = LanguageResponseData.fromJson(jsonData);
        //hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            languageListData = responseData.languageListData;
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
      //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    getLanguageListAPICall();

    return Scaffold(
      appBar: languageSelectionHeaderBar(context),
      body: SafeArea(
        child: Column(
          children: [
            //languageSelectionHeader(context),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Language",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/lang_select_image.png",
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "You can also change the language in App Settings after signing in",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius:
                      BorderRadius.circular(10), // Add rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  hint: const Text(
                    "Select Language",
                    style: TextStyle(
                      color: Color.fromARGB(255, 175, 173, 173),
                    ),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 212, 212, 212),
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Color.fromARGB(255, 212, 212, 212),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 231, 231, 231),
                        width: 1.0,
                      ),
                    ),
                  ),
                  value: selectedLanguage,
                  items: languageListData?.map((Language language) {
                    return DropdownMenuItem<String>(
                      value: language.languageName,
                      child: Row(
                        children: [
                          Radio<String>(
                            value: language.languageName,
                            groupValue: selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value;
                              });
                            },
                          ),
                          Text(
                            language.languageName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },
                  iconEnabledColor: Colors.grey,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSignUpBtn()
                /*   TextButton(
                  onPressed: () {
                    // Add your logic for handling the button press here
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnboardingOptions()), );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(
                        //     10.0), // Adjust the border radius as needed
                        side: BorderSide(
                          color: Colors.red, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                    ),
                  ),
                  child: const Text("Continue"),
                ),*/
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 40,
            child: OutlinedButton(
              style: secondaryButtonStyle(context, buttonPrimaryColor),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingOptions()),
                );
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Continue',
                    style: buttonTextStyle(context, Colors.white,
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
