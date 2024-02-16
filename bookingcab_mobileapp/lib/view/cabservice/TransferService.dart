import 'package:flutter/material.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';

class TransferService extends StatefulWidget {
  const TransferService({super.key});

  @override
  State<TransferService> createState() => _TransferServiceState();
}

class _TransferServiceState extends State<TransferService> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  bool _isSearchFocused = false;
  bool _isPickup = true;
  bool _isDrop = false;
  bool _isRideNow = true;
  bool _isRideLater = false;
  int selectedAdults = 1;
  int selectedChildren = 1;
  int selectedLuggages = 1;
  int selectedVehicles = 1;
  bool acceptTerms = false;
  List<int> countValues = [1, 2, 3, 4];

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, "Booking Cabs"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _serachBox(_searchController, _isSearchFocused),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Pickup"),
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: _isPickup,
                          onChanged: (value) {
                            setState(() {
                              _isPickup = value;
                              _isDrop = !value;
                            });
                          },
                          activeColor: buttonPrimaryColor,
                          activeTrackColor:
                              const Color.fromARGB(60, 95, 94, 94),
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Drop"),
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: _isDrop,
                          onChanged: (value) {
                            setState(() {
                              _isDrop = value;
                              _isPickup = !value;
                            });
                          },
                          activeColor: buttonPrimaryColor,
                          activeTrackColor:
                              const Color.fromARGB(60, 95, 94, 94),
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color.fromARGB(255, 197, 195, 195),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildTextField("City", _cityController),
                  _buildTextField("Airport/Railway Station", _cityController),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextField(
                            "Flight/ Train No", _cityController),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildTextField("Flight Time", _cityController),
                      ),
                    ],
                  ),
                  _buildTextField(_isDrop ? "Drop Location" : "Pickup Location",
                      _cityController),
                  _buildTextField("Landmark", _cityController),
                  _buildTextField("Pickup Address", _cityController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          "assets/images/location_image.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Ride Now (within 30 min)"),
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: _isRideNow,
                          onChanged: (value) {
                            setState(() {
                              _isRideNow = value;
                              _isRideLater = !value;
                            });
                          },
                          activeColor: buttonPrimaryColor,
                          activeTrackColor:
                              const Color.fromARGB(60, 95, 94, 94),
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Ride Later"),
                      Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: _isRideLater,
                          onChanged: (value) {
                            setState(() {
                              _isRideLater = value;
                              _isRideNow = !value;
                            });
                          },
                          activeColor: buttonPrimaryColor,
                          activeTrackColor:
                              const Color.fromARGB(60, 95, 94, 94),
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (_isRideLater) ...[
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Date"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.calendar_month),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Text(
                              "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.timelapse),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => _selectTime(context),
                          child: Text(
                              "${_selectedTime.hour}:${_selectedTime.minute}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Spacer(
                      flex: 9,
                    ),
                    Expanded(
                      flex: 10,
                      child: Divider(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text('Adults:'),
                          Row(
                            children: [
                              const Icon(Icons.man),
                              DropdownButton<int>(
                                value: selectedAdults,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedAdults = newValue!;
                                  });
                                },
                                items: countValues
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text("$value"),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Children:'),
                          Row(
                            children: [
                              const Icon(Icons.boy),
                              DropdownButton<int>(
                                value: selectedAdults,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedAdults = newValue!;
                                  });
                                },
                                items: List.generate(4, (index) {
                                  return DropdownMenuItem<int>(
                                    value: index + 1,
                                    child: Text((index + 1).toString()),
                                  );
                                }),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Luggages:'),
                      Row(
                        children: [
                          const Icon(Icons.luggage),
                          DropdownButton<int>(
                            value: selectedAdults,
                            onChanged: (newValue) {
                              setState(() {
                                selectedAdults = newValue!;
                              });
                            },
                            items: List.generate(4, (index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text((index + 1).toString()),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text('Vehicles:'),
                      Row(
                        children: [
                          const Icon(Icons.directions_car),
                          DropdownButton<int>(
                            value: selectedAdults,
                            onChanged: (newValue) {
                              setState(() {
                                selectedAdults = newValue!;
                              });
                            },
                            items: List.generate(2, (index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text((index + 1).toString()),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 24, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 5.0,
                      ),
                      onPressed: () {
                        // Handle signup logic here
                        // You can access user inputs using _firstNameController.text, _lastNameController.text, etc.
                      },
                      child: const Text(
                        'Next >>',
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

  Widget _serachBox(
      TextEditingController searchController, bool isSearchFocused) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.yellow,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search your cab for anywhere',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isSearchFocused = value.isNotEmpty;
                    });
                  },
                ),
              ),
              _isSearchFocused
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(
                          () {
                            _searchController.clear();
                            _isSearchFocused = false;
                          },
                        );
                      },
                    )
                  : const SizedBox.shrink(),
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
          // border: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
        ),
      ),
    );
  }
}