import 'dart:convert';
import 'dart:io';

import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccountResponseData.dart';
import 'package:bookingcab_mobileapp/view/profile/UpdateProfileInfoAPIResponseData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import 'package:image_picker/image_picker.dart';

class CompanyInfo extends StatefulWidget {
  final UserProfileData userProfileData;

  const CompanyInfo(this.userProfileData, {super.key});

  @override
  State<CompanyInfo> createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  String _selectedCountry = 'Country';

  TextEditingController _gstController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();
  TextEditingController _officeAddressController = TextEditingController();
  TextEditingController _panCardController = TextEditingController();
  //TextEditingController _aadharCardController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyEmailController = TextEditingController();
  TextEditingController _companyUrlController = TextEditingController();

  late UserProfileData userProfileData = widget.userProfileData;
  String companyName = '',
      companyAddress = '',
      cityID = '',
      cityName = '',
      stateID = '',
      stateName = '',
      nationalityID = '',
      nationalityName = '',
      pincode = '',
      serviceTaxGST = '',
      panCardNo = '',
      contactPersonName = '',
      landlineNo = '',
      mobileNo = '',
      companyEmail = '',
      websiteURL = '',
      createdDate = '';

  DateTime selectedDate = DateTime.now();

  List<String> _countries = [
    'Country',
    'India',
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
  ];

  File? _image;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setProfileDataToView();
    getProfileInfoAPICall();
    createdDate = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  void setProfileDataToView() {
    setState(() {
      serviceTaxGST = userProfileData.companySetupGstNo ?? '';
      companyName = userProfileData.companyName ?? '';

      cityID = userProfileData.cityId.toString();
      cityName = userProfileData.cityName ?? '';
      stateID = userProfileData.stateId.toString();

      stateName = userProfileData.stateName ?? '';
      companyAddress = userProfileData.companyAddress ?? '';
      panCardNo = userProfileData.companyPancardNo ?? '';
      contactPersonName = userProfileData.contactPersonName ?? '';

      nationalityID = userProfileData.companyId.toString();
      nationalityName = userProfileData.countryName ?? '';
      mobileNo = userProfileData.mobile ?? '';

      landlineNo = userProfileData.userCompanyLandlineNo ?? '';
      companyEmail = userProfileData.userCompanyEmail ?? '';
      pincode = userProfileData.userCompanyPincode ?? '';
      websiteURL = userProfileData.websiteUrl ?? '';

      _gstController.text = serviceTaxGST;
      _companyNameController.text = companyName;
      _cityController.text = cityName;
      _pinCodeController.text = pincode;
      _officeAddressController.text = companyAddress;
      _panCardController.text = panCardNo;
      //_aadharCardController.text = ;
      _contactController.text = contactPersonName;
      _mobileController.text = mobileNo;
      _phoneController.text = landlineNo;
      _companyEmailController.text = companyEmail;
      _companyUrlController.text = websiteURL;
    });
  }

  Future<void> signUpAPICall(BuildContext context) async {
    serviceTaxGST = _gstController.text.toString();
    companyName = _companyNameController.text.toString();
    cityName = _cityController.text.toString();
    pincode = _pinCodeController.text.toString();
    companyAddress = _officeAddressController.text.toString();
    panCardNo = _panCardController.text.toString();
    //_aadharCardController.text = ;
    contactPersonName = _contactController.text.toString();
    mobileNo = _mobileController.text.toString();
    landlineNo = _phoneController.text.toString();
    companyEmail = _companyEmailController.text.toString();
    websiteURL = _companyUrlController.text.toString();

    if (serviceTaxGST.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_GST_NO_MSG);
    } else if (companyName.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_NAME_MSG);
    } else if (cityName.isEmpty) {
      showErrorTost(context, INVALID_CITY_MSG);
    } else if (pincode.isEmpty) {
      showErrorTost(context, INVALID_PIN_CODE);
    } else if (companyAddress.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_Office_Address_MSG);
    } else if (panCardNo.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_PAN_MSG);
    } else if (contactPersonName.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_CONTACT_PERSONAL_NAME_MSG);
    } else if (mobileNo.isEmpty) {
      showErrorTost(context, INVALID_ALT_PHONE_NO_MSG);
    } else if (landlineNo.isEmpty) {
      showErrorTost(context, INVALID_LANDINE_NO_MSG);
    } else if (companyEmail.isEmpty) {
      showErrorTost(context, INVALID_EMAIL_ID_MSG);
    } else if (websiteURL.isEmpty) {
      showErrorTost(context, INVALID_COMAPNY_URL_MSG);
    } else {
      showCustomeLoader(context);

      Map<String, Object> queryParams = {
        "user_id": USER_ID,
        "company_name": companyName,
        "company_address": companyAddress,
        "city": cityID,
        "state": stateID,
        "country_id": nationalityID,
        "pincode": pincode,
        "service_tax_gst": serviceTaxGST,
        "pancard_no": panCardNo,
        "contact_person_name": contactPersonName,
        "landline_no": landlineNo,
        "mobile_no": mobileNo,
        "email": companyEmail,
        "website_url": websiteURL,
        "added_by": USER_ID,
        "created_date": createdDate
      };

      try {
        final response =
            await postRequest(UPADTE_COMPANY_END_POINT, queryParams);
        if (response.statusCode == 200) {
          // Handle successful response
          print('Response: ${response.body}');

          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = UpdateProfileInfoAPIResponseData.fromJson(
              jsonData['responsedata']);
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
      appBar: simpleHeaderBar(context, "Add Company Info"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('GST No.', _gstController),
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
              _buildTextField('Company Name', _companyNameController),
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
              const SizedBox(height: 10.0),
              _buildTextField('Office Address', _officeAddressController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child:
                        _buildTextField('Pan Card Details', _panCardController),
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
              /* const SizedBox(height: 10.0),
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
              */
              const SizedBox(height: 10.0),
              _buildTextField('Contact Person', _contactController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField('Phone Number', _phoneController),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  /* _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  */
                  Expanded(
                    child:
                        _buildTextField('landline Number', _mobileController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('Company Email Id', _companyEmailController),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child:
                        _buildTextField('Company URL', _companyUrlController),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Logo     Browse..",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                        ),
                        readOnly: true,
                        onTap: () {
                          _getImage();
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonSecondaryColor,
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
