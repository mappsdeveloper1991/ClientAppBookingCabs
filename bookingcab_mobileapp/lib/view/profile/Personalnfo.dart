import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageResponseData.dart';
import 'package:bookingcab_mobileapp/view/profile/EditProfile.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccountResponseData.dart';
import 'package:bookingcab_mobileapp/view/profile/UpdateProfileInfoAPIResponseData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';

class PersonalInfo extends StatefulWidget {
   final UserProfileData userProfileData;

  const PersonalInfo(this.userProfileData, {super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  TextEditingController _aadharCardController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _altphoneController = TextEditingController();
  TextEditingController _landLineController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _altEmailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController _cityController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();


  String _selectedCountry = 'Country';

  //String gender = 'Gender';

  List<String> _countries = [
    'Country',
    'India',
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
  ];

  List<String> _genders = [
    'Gender',
    'Male',
    'Female',
  ];






  DateTime selectedDate = DateTime.now();
  TextEditingController dateInput = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        //selectedDate = picked;
        dateInput.text = formattedDate;
        dob = formattedDate;
      });
    }
  }





  bool acceptTerms = true;
  bool subscribeNewsletter = true;
  late UserProfileData userProfileData  =  widget.userProfileData;
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
      _altphoneController.text = userProfileData.alternateMobile ?? '';
      _landLineController.text = userProfileData.landlineNumber ?? '';
      _addressController.text = userProfileData.address ?? '';
      _altEmailController.text = userProfileData.alternateEmail ?? '';
      _cityController.text = userProfileData.cityName ?? '';
      _pinCodeController.text = userProfileData.pincode.toString();
      dateInput.text = userProfileData.dob ?? '';

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
    alterNamteMobNo = _altphoneController.text.toString();
    landlineNumber = _landLineController.text.toString();
    alternateEmailID = _altEmailController.text.toString();
    address = _addressController.text.toString();
    pincode = _pinCodeController.text.toString();

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
      appBar: simpleHeaderBar(context, "Personal Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                        'Aadhar Card Number', _aadharCardController),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5.0,
                    ),
                    onPressed: () {
                      // Handle signup logic here
                      // You can access user inputs using _firstNameController.text, _lastNameController.text, etc.
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('First Name', _firstNameController),
              const SizedBox(height: 10.0),
              _buildTextField('Last Name', _lastNameController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextFieldDisable('Mobile Number', _mobileController),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField(
                        'Alt Mobile Number', _altphoneController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('Landline Number', _landLineController),
              const SizedBox(height: 10.0),
              _buildTextFieldDisable('Email Id', _emailController),
              const SizedBox(height: 10.0),
              _buildTextField('Alternate Email Id', _altEmailController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(child: _buildGenderDropdown()),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: dateInput,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                              Icons.calendar_today), //icon of text field
                          labelText: "Enter Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('Residential Address', _addressController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('City', _cityController),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: _buildTextField('Pincode', _pinCodeController),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        acceptTerms = value!;
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
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 5.0),
                      onPressed: () {
                        signUpAPICall(context);
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

  Widget _buildGenderDropdown() {
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
            value: gender,
            onChanged: (String? value) {
              setState(() {
                gender = value!;
              });
            },
            items: _genders.map<DropdownMenuItem<String>>((String value) {
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
