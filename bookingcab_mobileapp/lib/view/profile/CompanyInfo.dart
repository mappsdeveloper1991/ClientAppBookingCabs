import 'dart:io';

import 'package:flutter/material.dart';

import '../AppStyle/AppColors.dart';
import '../AppStyle/AppHeadreApp.dart';
import 'package:image_picker/image_picker.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({super.key});

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
  TextEditingController _aadharCardController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _companyEmailController = TextEditingController();
  TextEditingController _companyUrlController = TextEditingController();

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
              const SizedBox(height: 10.0),
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
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField('Mobile Number', _mobileController),
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
}
