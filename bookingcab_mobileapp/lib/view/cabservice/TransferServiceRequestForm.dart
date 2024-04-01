import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/cabservice/AddressSearchAPIresponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/AirportRailwayAPIResponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/BookingResponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/LocationSearchAPIResponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/TransferVehiclesList.dart';
import 'package:bookingcab_mobileapp/view/home/HomeTabScreen.dart';
import 'package:bookingcab_mobileapp/view/home/PackageCityListResponse.dart';
import 'package:bookingcab_mobileapp/view/signup/NationalityAPIResponseData.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



//if isPickup = True => Location & Address will be Pickup location    ||    City and Airport/Railway will be Drop Location
//if isPickup = fale => Location & Address will be Drop location      ||     City and Airport/Railway will be Pickup Location
var isPickup = true;

var pickupAddress = '';
var pickupLat = '';
var pickupLong = '';

var dropAddress = '';
var dropLat = '';
var dropLong = '';

var flightTrainNo = '';
var flightTrrainTime = '';
var  rideLatterDate = '';
var  rideLatterTime = '';




class TransferService extends StatefulWidget {
  const TransferService({super.key});

  @override
  State<TransferService> createState() => _TransferServiceState();
}

class _TransferServiceState extends State<TransferService> {
  TextEditingController _searchController = TextEditingController();
  //TextEditingController _cityController = TextEditingController();
  //TextEditingController _airportStationController = TextEditingController();
  TextEditingController _FlightTrainNoController = TextEditingController();
  //TextEditingController _FlightTrainTimeController = TextEditingController();
  //TextEditingController _PickupDropLocationController = TextEditingController();
  TextEditingController _LandmarkController = TextEditingController();
  //TextEditingController _PickupAddressController = TextEditingController();

  bool _isSearchFocused = false;
  bool acceptTerms = false;

  bool _isPickup = true;
  bool _isDrop = false;

  List<int> countValues = [1, 2, 3, 4];
  int selectedAdults = 1;
  int selectedChildren = 1;
  int selectedLuggages = 1;
  int selectedVehicles = 1;

  TimeOfDay _selectedTimeForFlightTrain = TimeOfDay.now();
  String flightOrTraintNo = '';
  String flightOrTrainTime = '';

  bool _isRideNow = true;
  bool _isRideLater = false;
  String isRideLaterDate = '', isLaterTime = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  List<CityList> cityListItems = [];
  List<NationalityList> nationalityListItems = [];
  List<AirportRailwayList> airportRaiwayListItems = [];
  List<LocationList> locationListItems = [];
  List<AddressList> addressListItems = [];

  String myCurrentLatitude = '0.0', myCurrentLongitude = '0.0';
  String cityID = "",
      cityName = "",
      cityLatitude = '0.0',
      cityLongitude = '0.0';
  String airportRailwayID = '',
      airportRailwayName = '',
      airportRailwayLatitude = '0.0',
      airportRailwayLongitude = '0.0';

  String pickupLocationID = '',
      pickupLocationName = '',
      pickupLocationLatitude = '0.0',
      pickupLocationLongitude = '0.0';
  String pickupAddressID = '',
      pickupAddressName = '',
      pickupAddressLatitude = '0.0',
      pickupAddressLongitude = '0.0',
      pickupCountryID = "",
      pickupStateID = "",
      pickupcityID = '';

  String nationalityID = '',
      nationalityName = '',
      nationalityLatitude = '0.0',
      nationalityLongitude = '0.0';

  String? _searchingWithQuery;
  late Iterable<String> _lastOptions = <String>[];
  static List<String> _kOptions = <String>[];

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
        isRideLaterDate =
            '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}';
      });
    }
  }

  Future<void> _selectTime(BuildContext context, String type) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        if (type == "flightTrainTime") {
          _selectedTimeForFlightTrain = pickedTime;
          flightOrTrainTime =
              '${_selectedTimeForFlightTrain.hour}:${_selectedTimeForFlightTrain.minute}';
        } else {
          _selectedTime = pickedTime;
          isLaterTime = '${_selectedTime.hour}:${_selectedTime.minute}';
        }
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
                      const Text("Pickup",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
                      const Text("Drop",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //_buildTextField("", "City", _cityController),
                  _autocompleteWidgit("City", "City *", 1),
                  const SizedBox(
                    height: 8,
                  ),
                  //_buildTextField("", "Airport/Railway Station", _airportStationController),
                  _autocompleteWidgit(
                      "AirportStations", "Airport/Railway Station *", 1),
                  const SizedBox(
                    height: 6,
                  ),

                  SizedBox(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildTextField(
                              "", "Flight/ Train No", _FlightTrainNoController),
                        ),
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child:
                              //_buildTextField("", "Flight Time", _FlightTrainTimeController),
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //  Text("Time"),

                              GestureDetector(
                                  onTap: () =>
                                      _selectTime(context, "flightTrainTime"),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "Time: ${_selectedTimeForFlightTrain.hour}:${_selectedTimeForFlightTrain.minute}",
                                    ),
                                  )),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //_buildTextField("", _isDrop ? "Drop Location" : "Pickup Location", _PickupDropLocationController),
                  _autocompleteWidgit("Location",
                      _isDrop ? "Drop Location" : "Pickup Location", 1),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextField("", "Landmark", _LandmarkController),
                  const SizedBox(
                    height: 8,
                  ),
                  //_buildTextField( "", "Pickup Address", _PickupAddressController),
                  _autocompleteWidgit("Address",
                      _isDrop ? "Drop Address" : "Pickup Address", 1),
                  const SizedBox(
                    height: 8,
                  ),

                  _autocompleteWidgit("Nationality", "Nationality", 1),
                  const SizedBox(
                    height: 8,
                  ),
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
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        mapType: MapType.normal, // Change to other map types
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        compassEnabled: true,
                        initialCameraPosition:  CameraPosition(target: LatLng(myCurrentLat, myCurrentLong), zoom: 12,),
                        //markers: markers,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        markers: Set<Marker>.of(markers.values),
                        polylines: Set<Polyline>.of(polylines.values),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ride",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Now (within 30 min)"),
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
                            const Text("Later"),
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
                  ]),
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
                          onTap: () => _selectTime(context, "RideLatterTime"),
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
                          const Text(
                            'Adults:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
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
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Children:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.boy),
                          DropdownButton<int>(
                            value: selectedChildren,
                            onChanged: (newValue) {
                              setState(() {
                                selectedChildren = newValue!;
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
                  Column(
                    children: [
                      const Text(
                        'Luggages:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.luggage),
                          DropdownButton<int>(
                            value: selectedLuggages,
                            onChanged: (newValue) {
                              setState(() {
                                selectedLuggages = newValue!;
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
                        getTransferVehicleList(context);

                        // Navigator.push(context, MaterialPageRoute( builder: (context) => TransferVehicles()), );
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

  Widget _buildTextField(
      String labelText, String hindTerxt, TextEditingController controller) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: hindTerxt,
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }

  Future<Iterable<String>> search(String query, String searchType) async {
     //await Future<void>.delayed(const Duration(seconds: 1)); // Fake 1 second delay.
    List<String>? cityListx = [];
    try {
      cityListx = await getCityListAPICall(query, searchType);
      _kOptions.clear();
      //setState(() {
        _kOptions = cityListx!;
     // });
    } catch (e) {
      print('Exception occurred in search api: $e');
    }
    if (query == '') {
      return _kOptions;
    }
    return _kOptions.where((String option) {
      return option.toLowerCase().startsWith(query.toLowerCase());
    });
  }

  Future<List<String>?> getCityListAPICall(
      String query, String searchType) async {
    late List<String> citylistp = [];
    _kOptions.clear();
     Map<String, Object> queryParams = {};

    try {
      var url = "";
      if (searchType.contains("City")) {
        if (query.isEmpty) {
          url = TRANSFAR_CITY_LIST;
        } else {
          url = '$TRANSFAR_CITY_LIST$query';
        }
      } else if (searchType.contains("AirportStations")) {
        queryParams = {"city_id": cityID};
        url =  TRANSFER_AIRPORT_STATION_LIST;
      } else if (searchType.contains("Location")) {
         queryParams = {"city_id": cityID, "area": query};
        url = TRANSFER_LOCATION_NAME;
      } else if (searchType.contains("Address")) {
        queryParams = {"city_id": cityID, "address": query};
        url = TRANSFER_LOCATION_ADDRESS;
      } else if (searchType.contains("Nationality")) {
        queryParams = {"nationality": query};
        url = Nationality_API_END_POINT;
      } else {
        print('Response getCityListAPICall XXXX: Not api call happed');
      }


      if(searchType.contains("City")){
        final response = await getRequestFullURL(url);
        if (response.statusCode == 200) {
          print('Response getCityListAPICall : ${response.body}');
          final jsonData = jsonDecode(response.body);
          if (searchType.contains("City")) {
            var responseData = PackageCityListResponse.fromJson(jsonData);
            cityListItems = responseData.cityList;
            for (var element in cityListItems) {
              citylistp.add(element.cityName);
            }
          } else {}
        }
      }
      else {
        //if (searchType.contains("AirportStations") || searchType.contains("Location") || searchType.contains("address") || searchType.contains("Nationality") ) 
        var response = await postRequest(url, queryParams);
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          if (searchType.contains("AirportStations") ) {
             var responseData = AirportRailwayAPIResponse.fromJson(jsonData['responsedata']);
             airportRaiwayListItems = responseData.airportRailwayList;
            for (var element in airportRaiwayListItems) {
              citylistp.add(element.airportRailwayName);
            }
          }
          else if (searchType.contains("Location")) {
             var responseData = LocationSearchAPIResponse.fromJson(jsonData['responsedata']);
             locationListItems = responseData.locationList;

            for (var element in locationListItems) {
              citylistp.add(element.area);
            }
          } 
          else if (searchType.contains("Address")) {
            var responseData = AddressSearchAPIresponse.fromJson(jsonData['responsedata']);
            addressListItems = responseData.addressList;
            for (var element in addressListItems) {
              citylistp.add(element.address);
            }
          }
          else if (searchType.contains("Nationality") ) {
            var responseData = NationalityAPIResponseData.fromJson(jsonData['responsedata']);
            nationalityListItems = responseData.data;
            for (var element in nationalityListItems) {
              citylistp.add(element.nationality);
            }
          }
        }
      } 
    } catch (e) {
      print('Exception occurred in api execution getCityListAPICall: $e');
      return null;
    }
    return citylistp;
  }

  Widget _autocompleteWidgit(
      String searchType, String hintTextVal, double width) {
    return Container(
        width: width == 1 ? MediaQuery.of(context).size.width * 0.95 : 110,
        child: InputDecorator(
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              hintStyle: TextStyle(color: Colors.grey),
              labelStyle: TextStyle(color: whiteColor)),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) async {
              _searchingWithQuery = textEditingValue.text;
              final Iterable<String> options =
                  await search(_searchingWithQuery!, searchType);
              if (_searchingWithQuery != textEditingValue.text) {
                return _lastOptions;
              }
              _lastOptions = options;
              return options;
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted) {
              return Container(
                margin: EdgeInsets.only(bottom: 0),
                alignment: Alignment
                    .bottomCenter, // Align the TextField to the bottom center
                constraints: BoxConstraints.tightFor(height: 35),
                child: TextField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  cursorColor: blackColor,
                  showCursor: true,
                  style: TextStyle(color: blackColor, fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero, // Remove content padding
                    isCollapsed: false,
                    labelText: fieldFocusNode.hasFocus ||
                            fieldTextEditingController.text.isNotEmpty
                        ? hintTextVal // Show label when focused or has value
                        : hintTextVal, //null, // Hide label otherwise
                    hintText: hintTextVal, // Set the hint text
                    hintStyle: const TextStyle(
                        color: lighGray2,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    labelStyle: const TextStyle(
                        color: lighGray2,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (text) {
                    debugPrint('You just onChanged text : $text');
                  },
                  onSubmitted: (text) {
                    debugPrint('You just onSubmitted text : $text');
                  },
                ),
              );
            },
            optionsViewBuilder: (BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options) {
              return Material(
                color: whiteColor,
                child: ListView.separated(
                  padding: EdgeInsets.all(5),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 0,
                  ),
                  itemCount: _lastOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        var slectedVal = _lastOptions.elementAt(index);
                        debugPrint(
                            'You just selected option seach type P:$searchType Elemt At Index: ${_lastOptions.elementAt(index)}} | searchType:$searchType');
                        setState(() {
                          if (searchType.contains("City")) {
                            cityID = '${cityListItems[index].cityId}';
                            cityName = cityListItems[index].cityName;
                            search("", "AirportStations");
                          } else if (searchType.contains("AirportStations")) {
                            airportRailwayID = '${airportRaiwayListItems[index].id}';
                            airportRailwayName = airportRaiwayListItems[index].airportRailwayName;
                            airportRailwayLatitude = airportRaiwayListItems[index].latitude;
                            airportRailwayLongitude = airportRaiwayListItems[index].longitude;

                             print('Latlong: pickupAddress: airportRailwayName:$airportRailwayName  airportRailwayLatitude:$airportRailwayLatitude  airportRailwayLongitude:$airportRailwayLongitude');
    

                            //search("", "Location");
                          } else if (searchType.contains("Location")) {
                            pickupLocationID = '${locationListItems[index].id}';
                            pickupLocationName = '${locationListItems[index].area}';
                            search("", "Address");
                          } else if (searchType.contains("Address")) {
                            pickupAddressID = '${addressListItems[index].id}';
                            pickupAddressName = addressListItems[index].address;
                            pickupAddressLatitude =
                                addressListItems[index].latitude;
                            pickupAddressLongitude =
                                addressListItems[index].longitude;
                            pickupCountryID =
                                '${addressListItems[index].countryId}';
                            pickupStateID =
                                '${addressListItems[index].stateId}';
                            pickupcityID = '${addressListItems[index].cityId}';
                            debugPrint(
                                'You just selected option XXX searchType:$searchType  pickupAddressID: $pickupAddressID pickupAddressName:$pickupAddressName  pickupcityID:$pickupcityID');
                            //search("", "Nationality");
                             print('Latlong: dropAddress: pickupAddressName:$pickupAddressName  pickupAddressLatitude:$pickupAddressLatitude  pickupAddressLongitude:$pickupAddressLongitude');

                            _getPolyline();
                          } else if (searchType.contains("Nationality")) {
                            nationalityID =  '${nationalityListItems[index].countryId}';
                          } else {}
                        });
                        onSelected(slectedVal);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              _lastOptions.elementAt(index).capitalize(),
                              style: const TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            onSelected: (String value) {
              debugPrint('You just selected value index : $value');
            },
          ),
        ));
  }


  Future<void> getTransferVehicleList(BuildContext context) async {
   flightTrainNo = _FlightTrainNoController.text.toString();
    var landMarkName = _LandmarkController.text.toString();

    flightTrrainTime = '${_selectedTimeForFlightTrain.hour}:${_selectedTimeForFlightTrain.minute}}';
    rideLatterDate = '${_selectedDate.day}:${_selectedDate.month}:${_selectedDate.year}';
    rideLatterTime ='${_selectedTime.hour}:${_selectedTime.minute}';

    if(_isPickup){
      isPickup = true;

      pickupAddress = pickupAddressName;
      pickupLat = pickupAddressLatitude;
      pickupLong = pickupAddressLongitude;

      dropAddress = airportRailwayName;
      dropLat = airportRailwayLatitude;
      dropLong = airportRailwayLongitude;

    }else{
      isPickup = false;

      pickupAddress = airportRailwayName ;
      pickupLat = airportRailwayLatitude ;
      pickupLong = airportRailwayLongitude ;

      dropAddress = pickupAddressName;
      dropLat = pickupAddressLatitude;
      dropLong = pickupAddressLongitude;
    }

    print('Latlong: pickupAddress: pickupAddress:$pickupAddress  pickupLat:$pickupLat  pickupLong:$pickupLong');
     print('Latlong: dropAddress: dropAddress:$dropAddress  dropLat:$dropLat  dropLong:$dropLong');

/*
    if (cityID.isEmpty) {
      showErrorTost(context, SELECET_CITY_NAME);
    } else if (airportRailwayID.isEmpty) {
      showErrorTost(context, SELECT_AIRPORT_RAILWAY);
    } else if (flightTrainO.isEmpty) {
      showErrorTost(context, FLIGHT_TRAIN_NO);
    } else if (pickupLocationID.isEmpty) {
      showErrorTost(context, SELECT_PICKUP_LOCATION);
    } else if (landMarkName.isEmpty) {
      showErrorTost(context, SELECT_PICKUP_LANDMARK);
    } else if (pickupAddressID.isEmpty) {
      showErrorTost(context, SELECT_PICKUP_Address);
    } else { */
      showCustomeLoader(context);
      Map<String, Object> queryParams = {
    "city_id": "707",
    "state_id": "10",
    "country_id": "101",
    "master_package_id": "1",
    "local_package_id": "14",
    "pickup_time": "11:07:45",
    "company_id": "1",
    "user_id": "859",
    "user_grade": "2",
    "user_type": "1",
    "company_gstno": "07AAACR0769G2ZE",
    "user_gstno": "",
    "parent_id": "0",
    "seating_capacity": "1",
    "luggage": "0",
    "pickup_date": "2024-03-27",
    "currency_id": "1",
    "vehicle_type": "1",
    "temp_id": "TMXC01414",
    "master_booking_type_id": "Transport",
    "total_days": "3",
    "drop_date": "28-3-2024",
    "drop_time": "",
    "no_of_vehicles": 1
        /*
        "city_id": pickupcityID, //"707",
        "state_id": pickupStateID, //"10",
        "country_id": pickupCountryID, //"101",
        "master_package_id": "1",
        "local_package_id": "14",
        "company_id": COMPANY_ID, //"1",
        "user_id": USER_ID,
        "user_grade": USER_GRADE, //"2",
        "user_type": USER_TYPE_ID, //"1",
        "company_gstno": "07AAACR0769G2ZE",
        "user_gstno": "",
        "parent_id": "0",
        "seating_capacity": "1",
        "luggage": "0",
        "currency_id": "1",
        "vehicle_type": "1",
        "temp_id": "TMXC01414",
        "master_booking_type_id": "Transport",
        "total_days": "1",
        "pickup_time": _isPickup ? flightOrTrainTime : "", // "11:07",
        "pickup_date": isRideLaterDate,
        "drop_date": isRideLaterDate,
        "drop_time": _isDrop ? flightOrTrainTime : "",
        "no_of_vehicles": 1
        */
      };

      try {
        final response =
            await postRequest(GET_TRANSFER_VEHICEL_LIST, queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = BookingResponse.fromJson(jsonData['responsedata']);
          hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
          print('Vehicle List Data: ${responseData.data.vehicleList}');
            Navigator.push(context, MaterialPageRoute( builder: (context) => TransferVehicles(responseData)), );

          } else {
            showErrorTost(context, responseData.message);
          }
        } else {
          hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
   // }
  }


  GoogleMapController? mapController;
  //Set<Marker> markers = {};
 // double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
 // double _destLatitude = 6.849660, _destLongitude = 3.648190;
  // double _originLatitude = 26.48424, _originLongitude = 50.04551;
  // double _destLatitude = 26.46423, _destLongitude = 50.06358;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAQgoHAq85_LZavL0SFS9sHuMVv3NpCfW8";

 double myCurrentLat = 28.5891734 , myCurrentLong = 77.3020327;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
     /* markers.add(const Marker(
        markerId: MarkerId('Current'),
        position: LatLng(12.847810, 77.663190),
        infoWindow: InfoWindow(title: 'San Francisco'),
      )); */
      MarkerId markerId = MarkerId("Current");
    Marker marker =
        Marker(markerId: markerId, position: LatLng(myCurrentLat, myCurrentLong));

      markers[markerId] = marker;
    });
  }

void addPickupMarker(){
  /// origin marker
        setState(() {
          /*
      markers.add(Marker(
        markerId: MarkerId("Pckup"),
        position: LatLng(double.parse(pickupAddressLatitude), double.parse(pickupAddressLongitude)),
        infoWindow: InfoWindow(title: pickupAddressName),
      ));
    }); */
    MarkerId markerId = MarkerId("Pckup");
    Marker marker = Marker(markerId: markerId, position: LatLng(double.parse(pickupAddressLatitude), double.parse(pickupAddressLongitude)));
    markers[markerId] = marker;
});
}

void addDropMarker(){
   setState(() {
/*
      markers.add(Marker(
        markerId: MarkerId("Drop"),
        position: LatLng(double.parse(airportRailwayLatitude), double.parse(airportRailwayLongitude)),
        infoWindow: InfoWindow(title: airportRailwayName),
      ));
*/
    MarkerId markerId = MarkerId("Drop");
    Marker marker = Marker(markerId: markerId, position: LatLng(double.parse(airportRailwayLatitude), double.parse(airportRailwayLongitude)));
    markers[markerId] = marker;

    });
}

_addPolyLine() {
  setState(() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    });
  }

  _getPolyline() async {

addPickupMarker();
addDropMarker();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(double.parse(pickupAddressLatitude), double.parse(pickupAddressLongitude)),
        PointLatLng(double.parse(airportRailwayLatitude), double.parse(airportRailwayLongitude)),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

}
