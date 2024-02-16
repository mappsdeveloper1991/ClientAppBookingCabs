import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/view/profile/CompanyInfo.dart';
import 'package:bookingcab_mobileapp/view/profile/Personalnfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../AppStyle/AppHeadreApp.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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

  bool acceptTerms = false;
  bool subscribeNewsletter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, "Kunal"),
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
                    child: _buildTextField('Mobile Number', _mobileController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  _buildCountryDropdown(),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child:
                        _buildTextField('Alt Mobile Number', _mobileController),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              _buildTextField('Landline Number', _mobileController),
              const SizedBox(height: 10.0),
              _buildTextField('support@bookingcabs.com', _emailController),
              const SizedBox(height: 10.0),
              _buildTextField('Alternate Email Id', _emailController),
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
                            builder: (context) => PersonalInfo(),
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
                              builder: (context) => CompanyInfo()),
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
                        // Handle signup logic here
                        // You can access user inputs using _firstNameController.text, _lastNameController.text, etc.
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
