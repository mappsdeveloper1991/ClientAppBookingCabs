// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ffi';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppUIComponent.dart';
import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/cabservice/TransferService.dart';
import 'package:bookingcab_mobileapp/view/home/DualImageCarosel.dart';
import 'package:bookingcab_mobileapp/view/home/OneWaysTransferAPIResponseData.dart';
import 'package:bookingcab_mobileapp/view/home/ThingToDoAPIResponseData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../AppStyle/AppColors.dart';
import '../../comman/Constant.dart';
import '../signup/CityAPIResponseData.dart';
import 'HomeCarousel.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String? selectedLocation = 'Delhi-NCR'; // Use String instead of Text

  TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    getOneWayPackageList();
    getThingToDoPackageList();
  }

  late List<OneWayPackageList> oneWaypackageList = [];
  Future<void> getOneWayPackageList() async {
    //showCustomeLoader(context);
    Map<String, Object> queryParams = {
      "source_city_id": "707",
      "destination_city_id": "4536",
      "user_grade": "5",
      "user_id": USER_ID,
      "callfrom": "MobileApp",
    };
    try {
      final response =
          await postRequest(OneWayPackageList_API_ENDPOINT_NAME, queryParams);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            OneWaysTransferAPIResponseData.fromJson(jsonData['responsedata']);
        //hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            oneWaypackageList = responseData.packageList;
          });

          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
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

  late List<ThingToDoList> thingToDoPackageList = [];
  Future<void> getThingToDoPackageList() async {
    //showCustomeLoader(context);
    Map<String, Object> queryParams = {
      "city": "707",
      "master_package_type": "6",
      "master_booking_type": "7",
      "user_id": USER_ID,
      "callfrom": "MobileApp",
    };
    try {
      final response =
          await postRequest(THING_TO_DO_API_ENDPOINT_NAME, queryParams);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            ThingToDoAPIResponseData.fromJson(jsonData['responsedata']);
        //hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            thingToDoPackageList = responseData.data;
          });

          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cabServiceType.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    _cabServiceTypeRedirect(cabServiceType[index].label);
                  },
                  child: CustomCard(
                    icon: cabServiceType[index].icon!,
                    label: "${cabServiceType[index].label}",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            hintText: 'Search your cab for anywhere',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: const SliderCarosel(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "One Way Transfer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            //height: 300,
                            child: Row(
                              children: [
                                Expanded(
                                    child: PackageTable(
                                        packageListData: oneWaypackageList)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Thing To Do",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          DualImageCarosel(
                            dataList: thingTodoList,
                            cardBuilder: (imageUrl, title) =>
                                ThingsToDoCard(image: imageUrl, title: title),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "We Offer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          DualImageCarosel(
                            dataList: offerList,
                            cardBuilder: (imageUrl, title) =>
                                CaroselCard(image: imageUrl, title: title),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Great Hotels",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          DualImageCarosel(
                            dataList: hotelofferList,
                            cardBuilder: (imageUrl, discount) =>
                                HotelCaroselCard(
                                    image: imageUrl, title: discount),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _cabServiceTypeRedirect(String? label) {
    if (label == "Transfer") {
      print("transfer selected");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TransferService()),
      );
    }
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CustomCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(top: 5.0, left: 3, right: 3, bottom: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            //offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(icon, size: 36),
            ),
            const SizedBox(height: 0),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String image;
  final int packageAmount;

  const PackageCard(
      {super.key, required this.image, required this.packageAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 180,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 10),
            Text(
              "$packageAmount",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCardDetails {
  IconData? icon;
  String? label;

  HomeCardDetails({required this.icon, required this.label});
}

class PackageDetails {
  String? image;
  int packageAmount;

  PackageDetails({required this.image, required this.packageAmount});
}

class PackageTable extends StatefulWidget {
  const PackageTable({super.key, required this.packageListData});
  final List<OneWayPackageList> packageListData;

  @override
  State<PackageTable> createState() => _PackageTableState();
}

class _PackageTableState extends State<PackageTable> {
  bool isTableExpanded = true;

  @override
  void initState() {
    super.initState();
    getOneWayPackageList();
  }

  void toggleTableExpansion() {
    setState(() {
      isTableExpanded = !isTableExpanded;
    });
  }

  late List<OneWayPackageList> packageList = []; //widget.packageListData;

  late List<City> cityList = [];
  late String fromCityID = "", fromCityName = '';
  late String toCityID = "", toCityName = '';

  Future<List<City>> seachCity(String query) async {
    getCityListAPICall(query);
    return await Future.delayed(const Duration(seconds: 1), () {
      return cityList.where((e) {
        return e.cityStateCountry.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> getCityListAPICall(String query) async {
    String cityName = query;
    showCustomeLoader(context);
    try {
      final response = await getRequest('$CITY_API_END_POINT$cityName');
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData = CityAPIResponseData.fromJson(jsonData['response']);
        hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            cityList = responseData.data;
          });
        } else {
          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
        }
      } else {
        // Handle error response
        hideCustomeLoader(context);
        showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      hideCustomeLoader(context);
      showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
      print('Exception occurred: $e');
    }
  }

  Future<void> getOneWayPackageList() async {
    //showCustomeLoader(context);
    Map<String, Object> queryParams = {
      "source_city_id": "707",
      "destination_city_id": "4536",
      "user_grade": "5",
      "user_id": USER_ID,
      "callfrom": "MobileApp",
    };
    try {
      final response =
          await postRequest(OneWayPackageList_API_ENDPOINT_NAME, queryParams);
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        final jsonData = jsonDecode(response.body);
        var responseData =
            OneWaysTransferAPIResponseData.fromJson(jsonData['responsedata']);
        //hideCustomeLoader(context);
        if (responseData.status == SUCCESS_STATUS) {
          setState(() {
            packageList = responseData.packageList;
          });

          //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
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

  // suggesstion list
  static const List<String> _fruitOptions = <String>[
    'Noida',
    'Delhi',
    'Gugagon',
    'Dehradun',
    'Durgapur',
    'Gwaliwar',
    'Noa',
    'Ahmdabad',
    'Agra',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            color: MaterialStateColor.resolveWith((states) => Colors.black),
            //height: 50,
            child: Row(
              children: [
                Container(
                  //padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(2),
                  height: 45,
                  width: 110,
                  // color: whiteColor,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        // border: OutlineInputBorder(gapPadding: 0.0),
                        //hintText: "Search..",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: whiteColor)),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue fruitTextEditingValue) {
                        // if user is input nothing
                        if (fruitTextEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        // if user is input something the build
                        // suggestion based on the user input
                        return _fruitOptions.where((String option) {
                          return option.contains(
                              fruitTextEditingValue.text.toLowerCase());
                        });
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        // Implement the text field UI
                        return TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          cursorColor: Colors.white,
                          style: TextStyle(color: whiteColor, fontSize: 12),
                          decoration: const InputDecoration(
                            //labelText: 'Type Here',
                            hintText: 'From City',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                            // [enabledBorder], displayed when [TextField, InputDecoration.enabled] is true
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            //[focusedBorder], displayed when [TextField, InputDecorator.isFocused] is true
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          onChanged: (text) {
                            // Update suggestions based on user input
                            // Implement the logic to filter and refresh suggestions
                            debugPrint('You just onChanged text : $text');
                          },
                          onSubmitted: (text) {
                            // Handle the submission of the selected suggestion
                            // Implement the logic for the selection action
                            debugPrint('You just onSubmitted text : $text');
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options) {
                        // Implement the UI for displaying the suggestion options
                        return Material(
                          color: whiteColor,
                          child: //ListTileExample(),
                              ListView.separated(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              height: 0,
                            ),
                            itemCount: _fruitOptions.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: ListTile(
                                  title: Text('${_fruitOptions[index]}'),
                                  onTap: () {
                                    // Handle the selection of an option
                                    onSelected('${_fruitOptions[index]}');
                                    debugPrint(
                                        'You just selected option : ${_fruitOptions[index]}');
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                      onSelected: (String value) {
                        debugPrint('You just selected value : $value');
                      },
                    ),
                  ),
                ),

                Container(
                  //padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(2),
                  height: 45,
                  width: 110,
                  // color: whiteColor,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        // border: OutlineInputBorder(gapPadding: 0.0),
                        //hintText: "Search..",
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: whiteColor)),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue fruitTextEditingValue) {
                        // if user is input nothing
                        if (fruitTextEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        // if user is input something the build
                        // suggestion based on the user input
                        return _fruitOptions.where((String option) {
                          return option.contains(
                              fruitTextEditingValue.text.toLowerCase());
                        });
                      },
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        // Implement the text field UI
                        return TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          cursorColor: Colors.white,
                          style: TextStyle(color: whiteColor, fontSize: 12),
                          decoration: const InputDecoration(
                            //labelText: 'Type Here',
                            hintText: 'To City',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                            // [enabledBorder], displayed when [TextField, InputDecoration.enabled] is true
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            //[focusedBorder], displayed when [TextField, InputDecorator.isFocused] is true
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          onChanged: (text) {
                            // Update suggestions based on user input
                            // Implement the logic to filter and refresh suggestions
                            debugPrint('You just onChanged text : $text');
                          },
                          onSubmitted: (text) {
                            // Handle the submission of the selected suggestion
                            // Implement the logic for the selection action
                            debugPrint('You just onSubmitted text : $text');
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options) {
                        // Implement the UI for displaying the suggestion options
                        return Material(
                          color: whiteColor,
                          child: //ListTileExample(),
                              ListView.separated(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              height: 0,
                            ),
                            itemCount: _fruitOptions.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: ListTile(
                                  title: Text('${_fruitOptions[index]}'),
                                  onTap: () {
                                    // Handle the selection of an option
                                    onSelected('${_fruitOptions[index]}');
                                    debugPrint(
                                        'You just selected option : ${_fruitOptions[index]}');
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                      onSelected: (String value) {
                        debugPrint('You just selected value : $value');
                      },
                    ),
                  ),
                ),

                
                _buildSignupButton()
              ],
            ),
          ),
          DataTable(
            horizontalMargin: 5,
            columnSpacing: 35,
            headingRowHeight: 0, //Add your height for showu table header colum
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.black),
            columns: const [
              DataColumn(
                label: Text(
                  'From',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                // numeric: true,
              ),
              DataColumn(
                label: Text(
                  'To',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                // numeric: true,
              ),
              DataColumn(
                label: Text(
                  'Price',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                // label: ColoredBox(
                //   color: Colors.orangeAccent,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 10, left: 10, top: 1, bottom: 1),
                //     child: Text(
                //       'Search',
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
                // numeric: true,
              ),
              DataColumn(label: SizedBox(child: Text(''))
                  /*IconButton(
                icon: Icon(
                  isTableExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  toggleTableExpansion();
                },
              ),
              numeric: true, */
                  ),
            ],
            rows: [
              //if (isTableExpanded)
              for (int i = 0; i < packageList.length; i++)
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        packageList[i].sourceCityName,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        packageList[i].destinationCityName,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        '\u{20B9} ${packageList[i].totalCharge}',
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const DataCell(
                      ColoredBox(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 5, left: 5, top: 1, bottom: 1),
                          child: Text(
                            maxLines: 1,
                            'Book',
                            style: TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ), // Add more rows as needed
            ],
          ),
        ]),
      ),
    );
  }

  Widget _buildSignupButton() {
    return Container(
      //margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 35, //1.4 * (MediaQuery.of(context).size.height / 20),
            width: 100,
            //margin: const EdgeInsets.only(bottom: 20),
            //child: RaisedButton(
            child: ElevatedButton(
              style: primaryButtonStyle(context, Colors.red),
              onPressed: () {
                getOneWayPackageList();
              },
              child: Text("Search",
                  style: buttonTextStyle(context, Colors.white, 12)),
            ),
          )
        ],
      ),
    );
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: //ListView(

            ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox(
          child: ListTile(title: Text('$index')),
        );
      },
/*
        children: const <Widget>[

          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
     
     */
    ));
  }
}

class PackageDetail {
  String from;
  String to;
  int amount;

  PackageDetail({required this.from, required this.to, required this.amount});
}

class CaroselCard extends StatelessWidget {
  const CaroselCard({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // width: double.infinity,
              height: 200.0,
              color: Colors.black.withOpacity(0.5),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HotelCaroselCard extends StatelessWidget {
  const HotelCaroselCard({super.key, required this.image, required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              top: 18,
              child: Card(
                elevation: 2.0,
                child: ColoredBox(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "$title % Discount",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThingsToDoCard extends StatelessWidget {
  const ThingsToDoCard({super.key, required this.image, required this.title});

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 2,
                child: ColoredBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "INR $title",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const ColoredBox(
                        color: Colors.black,
                        child: SizedBox(
                          height: 21,
                          width: 2,
                        ),
                      ),
                      const Text(
                        "Book",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
