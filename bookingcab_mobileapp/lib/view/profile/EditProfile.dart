import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/profile/CompanyInfo.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccountResponseData.dart';
import 'package:bookingcab_mobileapp/view/profile/Personalnfo.dart';
import 'package:bookingcab_mobileapp/view/profile/UpdateProfileInfoAPIResponseData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../AppStyle/AppHeadreApp.dart';

class EditProfile extends StatefulWidget {
  final UserProfileData userProfileData;

  const EditProfile(this.userProfileData, {super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _mobileAltController = TextEditingController();
  TextEditingController _landlineontroller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _compEmailController = TextEditingController();
  TextEditingController _compAltEmailController = TextEditingController();
  TextEditingController _companyController = TextEditingController();

  // Dropdown values
  String _selectedCountryCode =
      '+91'; // Initial value for country code dropdown
  String _selectedCountry =
      'United States'; // Initial value for country dropdown

  // List of countries
  List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    // Add more countries as needed
  ];

  bool acceptTerms = true;
  bool subscribeNewsletter = true;
  late UserProfileData userProfileData = widget.userProfileData;
  late String firstName = "",
      lastName = "",
      emailID = "",
      alternateEmailID = '',
      mobileNo = "",
      alterNamteMobNo = "",
      landlineNumber = '',
      cityID = "",
      cityName = "",
      stateID = "",
      stateName = "",
      nationalityID = "",
      nationalityName = '',
      companyName = '',
      dob = '',
      father_name = '',
      gender = '',
      address = '',
      pincode = '',
      signup_status = '';

  @override
  void initState() {
    super.initState();
    setProfileDataToView();

    getProfileInfoAPICall();
  }

  void setProfileDataToView() {
    setState(() {
      _firstNameController.text = userProfileData.firstName ?? '';
      _lastNameController.text = userProfileData.lastName ?? '';
      _mobileController.text = userProfileData.mobile ?? '';
      _emailController.text = userProfileData.email ?? '';
      _mobileAltController.text = userProfileData.alternateMobile ?? '';
      _landlineontroller.text = userProfileData.landlineNumber ?? '';
      _companyController.text = userProfileData.companyName ?? '';
      _compEmailController.text = userProfileData.userCompanyEmail ?? '';
      _compAltEmailController.text = userProfileData.alternateEmail ?? '';

      firstName = userProfileData.firstName ?? '';
      lastName = userProfileData.lastName ?? '';
      emailID = userProfileData.email ?? '';
      alternateEmailID = userProfileData.alternateEmail ?? '';
      mobileNo = userProfileData.mobile ?? '';
      alterNamteMobNo = userProfileData.alternateMobile ?? '';
      landlineNumber = userProfileData.landlineNumber ?? '';
      cityID = userProfileData.cityId.toString();
      cityName = userProfileData.cityName ?? '';
      stateID = userProfileData.stateId.toString();
      stateName = userProfileData.stateName ?? '';
      nationalityID = userProfileData.companyId.toString();
      nationalityName = userProfileData.countryName ?? '';
      companyName = userProfileData.companyName ?? '';
      dob = userProfileData.dob ?? '';
      father_name = userProfileData.fatherName ?? '';
      gender = userProfileData.gender ?? 'Male';
      address = userProfileData.address ?? '';
      pincode = userProfileData.pincode.toString();
    });
  }

  Future<void> signUpAPICall(BuildContext context) async {
    firstName = _firstNameController.text.toString();
    lastName = _lastNameController.text.toString();
    alterNamteMobNo = _mobileAltController.text.toString();
    landlineNumber = _landlineontroller.text.toString();
    alternateEmailID = _compAltEmailController.text.toString();
    companyName = _companyController.text.toString();

    if (firstName.isEmpty) {
      showErrorTost(context, INVALID_FIRST_NAME_MSG);
    } else if (lastName.isEmpty) {
      showErrorTost(context, INVALID_LAST_NAME_MSG);
    } else if (alterNamteMobNo.isEmpty) {
      showErrorTost(context, INVALID_ALT_HONE_NO_MSG);
    } else if (landlineNumber.isEmpty) {
      showErrorTost(context, INVALID_LANDINE_NO_MSG);
    } else if (alternateEmailID.isEmpty) {
      showErrorTost(context, INVALID_ALT_EMAIL_ID_MSG);
    } else if (companyName.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_NAME_MSG);
    } else {
      showCustomeLoader(context);

      Map<String, Object> queryParams = {
        "first_name": firstName,
        "last_name": lastName,
        "father_name": father_name,
        "alternate_email": alternateEmailID,
        "landline_number": landlineNumber,
        "alternate_mobile": alterNamteMobNo,
        "dob": dob,
        "gender": gender,
        "address": address,
        "city": cityID,
        "state": stateID,
        "country_id": nationalityID,
        "pincode": pincode,
        "user_id": USER_ID,
        "signup_status": "2",
        "kyc_type": "13",
        "kyc": "543543534",
        "newsletter_subscription": "0",
        "signup_status": "2"
      };

      try {
        final response =
            await postRequest(Update_Signup_Infor_API, queryParams);
        if (response.statusCode == 200) {
          // Handle successful response
          print('Response: ${response.body}');

          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData =
              UpdateProfileInfoAPIResponseData.fromJson(jsonData['response']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
            showErrorTost(context, responseData.message);
            getProfileInfoAPICall();
          } else {
            showErrorTost(context, responseData.message);
          }
        } else {
          // Handle error response
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
    }
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
            setProfileDataToView();
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
      showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
      print('Exception occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, '${userProfileData.firstName}'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      maxRadius: 50,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _buildTextField('First Name', _firstNameController),
              const SizedBox(height: 10.0),
              _buildTextField('Last Name', _lastNameController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  _buildCountryCodeDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextFieldDisable(
                        'Mobile Number', _mobileController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField(
                        'Alt Mobile Number', _mobileAltController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('Landline Number', _landlineontroller),
              const SizedBox(height: 10.0),
              _buildTextFieldDisable('Email', _emailController),
              const SizedBox(height: 10.0),
              _buildTextField('Alternate Email Id', _compAltEmailController),
              const SizedBox(height: 10.0),
              _buildTextField('Company', _companyController),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        acceptTerms = value!;
                        acceptTerms = true!;
                      });
                    },
                    activeColor: buttonPrimaryColor,
                  ),
                  const Text(
                    'Accept Terms and Conditions',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: subscribeNewsletter,
                    onChanged: (value) {
                      setState(() {
                        subscribeNewsletter = value!;
                        subscribeNewsletter = true;
                      });
                    },
                    activeColor: buttonPrimaryColor,
                  ),
                  const Text(
                    'Subscribe Newsletter',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the yellow button
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalInfo(userProfileData),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonPrimaryColor,
                        shape: const RoundedRectangleBorder(),
                        elevation: 5.0,
                      ),
                      child: const Text(
                        'Personal Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ), // Adjust spacing as needed
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the red button

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CompanyInfo(userProfileData)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonPrimaryColor,
                          shape: const RoundedRectangleBorder(),
                          elevation: 5.0),
                      child: const Text(
                        'Company Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonSecondaryColor,
                          shape: const RoundedRectangleBorder(),
                          elevation: 5.0),
                      onPressed: () {
                        signUpAPICall(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              )
            ],
          ),
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
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
        ),
      ),
    );
  }

  Widget _buildTextFieldDisable(
      String labelText, TextEditingController controller) {
    return SizedBox(
      height: 45,
      child: TextField(
        enabled: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
        ),
      ),
    );
  }

  Widget _buildCountryCodeDropdown() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 73, 73, 73),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 45,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/images/flag_india.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCountryCode,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCountryCode = value!;
                    });
                  },
                  items: ['+1', '+44', '+49', '+33', '+91']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCountryDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 84, 83, 83),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 45,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedCountry,
            onChanged: (String? value) {
              setState(() {
                _selectedCountry = value!;
              });
            },
            items: _countries.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
