import 'dart:convert';

import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/language/LanguageResponseData.dart';
import 'package:bookingcab_mobileapp/view/profile/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

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

  String _selectedGender = 'Gender';

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





  bool acceptTerms = false;

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
      });
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
                    child: _buildTextField('Mobile Number', _mobileController),
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
              _buildTextField('Email Id', _emailController),
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
                        // Handle signup logic here
                        // You can access user inputs using _firstNameController.text, _lastNameController.text, etc.
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
            value: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value!;
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
