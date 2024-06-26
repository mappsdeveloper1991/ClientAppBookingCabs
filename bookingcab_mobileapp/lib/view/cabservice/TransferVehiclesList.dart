import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/cabservice/BookingResponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/RouteDistanceAndTimeResponse.dart';
import 'package:bookingcab_mobileapp/view/cabservice/TransferServiceRequestForm.dart';
import 'package:bookingcab_mobileapp/view/cabservice/TransferVehiclesDetails.dart';
import 'package:flutter/material.dart';

late BookingResponse bookingResponseDataGlobal;
List<Vehicle> vehicleListData = [];

class TransferVehicles extends StatefulWidget {
  final BookingResponse bookingResponseData;

  const TransferVehicles(this.bookingResponseData, {super.key});

  @override
  State<TransferVehicles> createState() => _TransferVehiclesState();
}

class _TransferVehiclesState extends State<TransferVehicles> {
  @override
  void initState() {
    super.initState();
    setState(() {
      bookingResponseDataGlobal = widget.bookingResponseData;
      vehicleListData = bookingResponseDataGlobal.data.vehicleList;
    });
  }

  int selectedIndex = -1;
  void updateMessage(int selectedIndex) {
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  var _dataFromChild = '';
  void _handleCallback(String data) {
    setState(() {
      _dataFromChild = data;
      print('Button pressed in child widget $_dataFromChild');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, "Airport Transfer"),
      body: Column(
        children: [
          const HeaderDetails(),
          const Divider(
            color: buttonPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No of Results: ${vehicleListData.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.filter_alt,
                      color: buttonPrimaryColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        //openPopup();

                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FilterVehicle()),
                        ); */

                        RenderBox renderBox =
                            context.findRenderObject() as RenderBox;
                        //Navigator.pop(context);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => DriverDetails()), );
                        var _tapPosition = renderBox.localToGlobal(Offset.zero);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopupPageX(_tapPosition,
                                _handleCallback); // Show the popup when button is pressed
                          },
                        );
                      },
                      child: const Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ColoredBox(
              color: const Color.fromARGB(255, 231, 234, 246),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: vehicleListData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _VehicleDetailCard(
                      updateParentMessage: updateMessage,
                      currentIndex: index,
                      selectedIndex: selectedIndex,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> sortedByFilterItemsList = [];
List<Map<String, dynamic>> categoryByFilterItemsList = [];
List<Map<String, dynamic>> modelByFilterItemsList = [];

List<Map<String, dynamic>> colorByFilterItemsList = [];
List<Map<String, dynamic>> fuleByFilterItemsList = [];
List<Map<String, dynamic>> cancellaionByFilterItemsList = [];
List<Map<String, dynamic>> paymentByFilterItemsList = [];

class PopupPageX extends StatefulWidget {
  final Offset tapPosition;
  final Function(String) callback;

  const PopupPageX(this.tapPosition, this.callback, {super.key});

  @override
  State<PopupPageX> createState() => _PoupPageX();
}

class _PoupPageX extends State<PopupPageX> {
  void getFilterList() {
    sortedByFilterItemsList
        .add({"title": "Price Low to High", "isChecked": false});
    sortedByFilterItemsList
        .add({"title": "Price High to Low", "isChecked": false});
    sortedByFilterItemsList
        .add({"title": "Avg. Customer Reviews", "isChecked": false});
    sortedByFilterItemsList.add({"title": "New Arrival", "isChecked": false});

    categoryByFilterItemsList.add({"title": "Hatchback", "isChecked": false});
    categoryByFilterItemsList.add({"title": "Sedan", "isChecked": false});
    categoryByFilterItemsList.add({"title": "Prime", "isChecked": false});

    modelByFilterItemsList.add({"title": "Hatchback", "isChecked": false});
    modelByFilterItemsList.add({"title": "Any", "isChecked": false});
    modelByFilterItemsList.add({"title": "2024", "isChecked": false});
    modelByFilterItemsList.add({"title": "2022 or Latest", "isChecked": false});
    modelByFilterItemsList.add({"title": "2020 or Latest", "isChecked": false});
    modelByFilterItemsList.add({"title": "Any", "isChecked": false});

    colorByFilterItemsList.add({"title": "Black", "isChecked": false});
    colorByFilterItemsList.add({"title": "White", "isChecked": false});
    colorByFilterItemsList.add({"title": "Any", "isChecked": false});

    fuleByFilterItemsList.add({"title": "Petrol", "isChecked": false});
    fuleByFilterItemsList.add({"title": "Diesel", "isChecked": false});
    fuleByFilterItemsList.add({"title": "CNG", "isChecked": false});
    fuleByFilterItemsList.add({"title": "EV", "isChecked": false});
    fuleByFilterItemsList.add({"title": "Hybrid", "isChecked": false});
    fuleByFilterItemsList.add({"title": "Any", "isChecked": false});

    cancellaionByFilterItemsList
        .add({"title": "Free Cancellation", "isChecked": false});
    cancellaionByFilterItemsList
        .add({"title": "10% Cancellation", "isChecked": false});
    cancellaionByFilterItemsList
        .add({"title": "25% Cancellation", "isChecked": false});
    cancellaionByFilterItemsList
        .add({"title": "50% Cancellation", "isChecked": false});
    cancellaionByFilterItemsList
        .add({"title": "100% Cancellation", "isChecked": false});

    paymentByFilterItemsList.add({"title": "Pay on Trip", "isChecked": false});
    paymentByFilterItemsList.add({"title": "10% Advance", "isChecked": false});
    paymentByFilterItemsList.add({"title": "20% Advance", "isChecked": false});
    paymentByFilterItemsList.add({"title": "50% Advance", "isChecked": false});
    paymentByFilterItemsList.add({"title": "100% Advance", "isChecked": false});
  }

  @override
  void initState() {
    super.initState();

    getFilterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Dismiss the popup when tapping outside
            },
            child: Container(
              color: Colors
                  .black54, // Semi-transparent black color for shadow effect
            ),
          ),
          Positioned(
              top: 60, //widget.tapPosition.dx,
              right: widget.tapPosition.dx + 0,
              bottom: 1,
              child: Container(
                  width: 200,
                  height: MediaQuery.of(context)
                      .size
                      .height, // Adjust height as needed
                  color: Colors.grey[900], // Popup background color
                  child: Column(
                    children: [
                      //          crossAxisAlignment: CrossAxisAlignment.start,
                      // children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Filter By",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Clear All",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Preffered Feature",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text("")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Sort",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount: sortedByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            sortedByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !sortedByFilterItemsList[index]
                                                    ["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                sortedByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color: sortedByFilterItemsList[
                                                        index]["isChecked"]
                                                    ? Colors.red
                                                    : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                sortedByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Category",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount:
                                          categoryByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            categoryByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !categoryByFilterItemsList[
                                                    index]["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                categoryByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color:
                                                    categoryByFilterItemsList[
                                                            index]["isChecked"]
                                                        ? Colors.red
                                                        : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                categoryByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Modal",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount: modelByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            modelByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !modelByFilterItemsList[index]
                                                    ["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                modelByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color: modelByFilterItemsList[
                                                        index]["isChecked"]
                                                    ? Colors.red
                                                    : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                modelByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Color",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount: colorByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            colorByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !colorByFilterItemsList[index]
                                                    ["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                colorByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color: colorByFilterItemsList[
                                                        index]["isChecked"]
                                                    ? Colors.red
                                                    : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                colorByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Fuel",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount: fuleByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            fuleByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !fuleByFilterItemsList[index]
                                                    ["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                fuleByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color:
                                                    fuleByFilterItemsList[index]
                                                            ["isChecked"]
                                                        ? Colors.red
                                                        : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                fuleByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Cancellation",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount:
                                          cancellaionByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            cancellaionByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !cancellaionByFilterItemsList[
                                                    index]["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                cancellaionByFilterItemsList[
                                                        index]["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color:
                                                    cancellaionByFilterItemsList[
                                                            index]["isChecked"]
                                                        ? Colors.red
                                                        : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                cancellaionByFilterItemsList[
                                                    index]["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              //height: 300, // Example height
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //height: 40,
                                      width: 300,
                                      color: blackColor,
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 2, bottom: 2),
                                      child: const Text(
                                        "Payment",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics:
                                          ScrollPhysics(), // Allow ListView to scroll
                                      shrinkWrap: true,
                                      itemCount:
                                          paymentByFilterItemsList.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            paymentByFilterItemsList[index]
                                                    ["isChecked"] =
                                                !paymentByFilterItemsList[index]
                                                    ["isChecked"];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          padding: EdgeInsets.all(5),
                                          height:
                                              27, // Set your custom height here
                                          child: Row(
                                            children: [
                                              Icon(
                                                paymentByFilterItemsList[index]
                                                        ["isChecked"]
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color: paymentByFilterItemsList[
                                                        index]["isChecked"]
                                                    ? Colors.red
                                                    : Colors.grey,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                paymentByFilterItemsList[index]
                                                    ["title"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ))),
        ],
      ),
    );
  }
}

class _VehicleDetailCard extends StatefulWidget {
  const _VehicleDetailCard(
      {super.key,
      required this.updateParentMessage,
      required this.selectedIndex,
      required this.currentIndex});

  final Function(int) updateParentMessage;
  final int selectedIndex;
  final int currentIndex;

  @override
  State<_VehicleDetailCard> createState() => _VehicleDetailCardState();
}

class _VehicleDetailCardState extends State<_VehicleDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("car clicked..");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectedVehicleDetails()),
        );
      },
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: [
                              Expanded(
                                child:
                                    //Image.asset("assets/images/economy.png",
                                    Image.network(
                                  '${vehicleListData[widget.currentIndex].basePath}${vehicleListData[widget.currentIndex].vehicleImage}',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const VerticalDivider(
                                //color: Color.fromARGB(255, 230, 227, 227),
                                color: Color.fromARGB(255, 242, 236, 236),
                                thickness: 1,
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: 6,
                              width: 120,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        '${vehicleListData[widget.currentIndex].vehicleName} - ${vehicleListData[widget.currentIndex].ignitionType}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    _circleWithText(Icons.person,
                                        '${vehicleListData[widget.currentIndex].seatingCapacity}'),
                                    _circleWithText(Icons.business_center,
                                        '${vehicleListData[widget.currentIndex].vehicleBaggage}'),
                                    _circleWithTextImage("assets/images/AC.png",
                                        '${vehicleListData[widget.currentIndex].vehicleIgnitionType}'),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 4,

                              //padding: EdgeInsets.only(right: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\u{20B9} ${vehicleListData[widget.currentIndex].totalPrice}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        'Inc of Taxes',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 203, 201, 201),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: buttonPrimaryColor,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '${vehicleListData[widget.currentIndex].duration} MIN',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.speed,
                                            color: buttonPrimaryColor,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '${vehicleListData[widget.currentIndex].estimatedDistance} KM',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 242, 236, 236),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _bottomDataOfVehicleCard(
                        Icons.currency_rupee,
                        "Fare  ",
                      ),
                      _bottomDataOfVehicleCard(
                        Icons.my_location,
                        "Meeting Point",
                      ),
                      _bottomDataOfVehicleCard(
                        Icons.policy,
                        "Cancellation",
                      ),
                      _bottomDataOfVehicleCard(
                        Icons.wine_bar,
                        "Amenities",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomDataOfVehicleCard(IconData icon, String textValue) {
    return GestureDetector(
      onTap: () {
        print("$textValue clicked..");
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            maxRadius: 8,
            child: Icon(
              icon,
              size: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            textValue,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleWithText(IconData icon, String text) {
    return Column(
      children: [
        Row(
          children: [
            _lineWidget(),
            _circleWidget(
              Icon(
                icon,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }

  Widget _circleWithTextImage(String imagePath, String text) {
    return Column(
      children: [
        Row(
          children: [
            _lineWidget(),
            _circleWidget(
              Image.asset(
                imagePath,
                color: Colors.grey,
                height: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }

  Widget _lineWidget() {
    return Container(
      color: Colors.grey,
      height: 4,
      width: 8,
    );
  }

  Widget _circleWidget(Widget _widget) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey, // Set border color here
          width: 2.0, // Set border width here
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 10,
        child: _widget,
      ),
    );
  }





 

}

class HeaderDetails extends StatefulWidget {
  const HeaderDetails({super.key,});

@override
State<HeaderDetails> createState() => _headerDetailsState();

}



class _headerDetailsState extends State<HeaderDetails>{

@override
  void initState() {
    // TODO: implement initState
    getTimeDistanceBetweenPoint();
  }

   String estimatedDistnace = '0.0 KM';
  String estimatedTime = '0.0 Mint';

  Future<void> getTimeDistanceBetweenPoint() async {
    String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$pickupLat,$pickupLong&destinations=$dropLat,$dropLong&key=AIzaSyAQgoHAq85_LZavL0SFS9sHuMVv3NpCfW8';
    final response = await getRequestFullURL(url);
    if (response.statusCode == 200) {
      print('Response getCityListAPICall : ${response.body}');
      final jsonData = jsonDecode(response.body);
      var responseData = RouteDistanceAndTimeResponse.fromJson(jsonData);

        setState(() {
        estimatedDistnace = responseData.rows[0].elements[0].distance.text;
        estimatedTime = responseData.rows[0].elements[0].duration.text;

        });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: buttonPrimaryColor,
                          size: 20,
                        ),
                        Text(
                          "Time: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rideLatterDate,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        rideLatterTime,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.speed,
                          color: buttonPrimaryColor,
                          size: 20,
                        ),
                        Text(
                          "Duraction: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        estimatedTime,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        estimatedDistnace,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.green,
                  size: 18,
                ),
                Text("Pickup: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 3,
                ),
                Text(
                  pickupAddress,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 18,
              ),
              Text("Drop: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: 3,
              ),
              Text(
                dropAddress,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ]));
  }


  
}

//https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=12.847810,77.663190&destinations=12.842410,77.668820&key=AIzaSyAQgoHAq85_LZavL0SFS9sHuMVv3NpCfW8
