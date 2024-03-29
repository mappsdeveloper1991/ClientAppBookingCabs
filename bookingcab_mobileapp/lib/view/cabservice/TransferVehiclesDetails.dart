import 'dart:ffi';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:bookingcab_mobileapp/view/cabservice/BookingRequestWatingCountDown.dart';
import 'package:flutter/material.dart';

import 'package:popover/popover.dart';

class SelectedVehicleDetails extends StatefulWidget {
  const SelectedVehicleDetails({super.key});

  @override
  State<SelectedVehicleDetails> createState() => _SelectedVehicleDetailsState();
}

class _SelectedVehicleDetailsState extends State<SelectedVehicleDetails> {
  bool _showCard = false;

  void _toggleCardVisibility() {
    setState(() {
      _showCard = !_showCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 207, 207),
      appBar: simpleHeaderBar(context, "Airport Transfer"),
      body: Expanded(
        child: Column(
          children: [
            const _headerDetails(),
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ColoredBox(
                        color: const Color.fromARGB(255, 208, 207, 207),
                        child: Column(
                          children: [
                            _carDetailCard(),
                            _otherFairDetailCard(
                              "Sightseeings",
                              "Red Fort, Lotus Temple",
                              "502",
                              380.0
                            ),
                            _driverDetailCard(),
                            _otherFairDetailCard(
                              "Guide",
                              "Hindi UnderStanding...",
                              "504",
                              400.0
                            ),
                            _otherFairDetailCard(
                              "Attraction",
                              "Light and Sound Show..",
                              "505",
                              400
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 0, 50, 0),
                                    backgroundColor:
                                        buttonPrimaryColor, // buttonSecondaryColor, // Adjust according to your theme
                                    shape: const RoundedRectangleBorder(),
                                  ),
                                  onPressed: () {
                                    // Test
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookingRequest()),
                                    );
                                  },
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
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
                if (_showCard)
                  Positioned.fill(
                    //top: MediaQuery.of(context).size.height * 0.01,
                    child: _InfoCard(
                      toggleCard: _toggleCardVisibility,
                    ), //infoCard(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _carDetailCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 75,
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SEDAN",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Dezire, Etios or similar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    "assets/images/dsire_car.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      '\u{20B9} 50001',
                      style: TextStyle(
                        color: buttonPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    InforPopupOverView(450.0),
                    /*
                    GestureDetector(
                      onTap: () {
                        _toggleCardVisibility();
                      },
                      child: const Icon(
                        Icons.info,
                        color: buttonPrimaryColor,
                      ),
                    ), */
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.edit_document,
                    color: buttonPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otherFairDetailCard(String value1, String value2, String price, double popupheight) {
    return SizedBox(
      height: 75,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
               Row(
                children: [
                  Text(
                    '\u{20B9} $price',
                    style: const TextStyle(
                      color: buttonPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  InforPopupOverView(popupheight),
                  /* Icon(
                    Icons.info,
                    color: buttonPrimaryColor,
                  ), */
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.edit_document,
                  color: buttonPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _driverDetailCard() {
    return SizedBox(
      height: 150,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Driver",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Hindi UnderStanding..",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        '\u{20B9} 50003',
                        style: TextStyle(
                          color: buttonPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      /* Icon(
                        Icons.info,
                        color: buttonPrimaryColor,
                      ), */
                      InforPopupOverView(350)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.edit_document,
                      color: buttonPrimaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 32, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage("assets/images/driver-icon-27013.png"),
                    height: 40, // Set the desired height
                    width: 40, // Set the desired width
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "- Hindi UnderStanding & Speaking Driver",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "- Night Charge Extra",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "- Meal Extra",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _headerDetails extends StatelessWidget {
  const _headerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Delhi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: buttonPrimaryColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "24 Aug",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: buttonPrimaryColor,
                        ),
                        Text(
                          "11:AM",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Pickup Address1, Add,Pickup Address1, Add i",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Duration",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1 Days",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "15 KM",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: buttonPrimaryColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '\u{20B9} 5000',
                          style: TextStyle(
                            color: buttonPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.edit_document,
                        color: buttonPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
          //header(),
          ),
    );
  }
}

*/

class _headerDetails extends StatelessWidget {
  const _headerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: whiteColor,
        padding: EdgeInsets.all(5),
        // margin: EdgeInsets.all(5),
        child: const Column(children: [
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
                      Text(
                        "27 Min",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "24 KM",
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
                        "24 Aug",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "11:AM",
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
          Row(
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
                "DB Gobta Road KarolBag, New Delhi ",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
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
                "New Delhi Railway Station, Delhi",
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

class _InfoCard extends StatelessWidget {
  final VoidCallback toggleCard;
  const _InfoCard({super.key, required this.toggleCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Terms & conditions ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggleCard();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _termsConditionWidget(
                      "Incuded km:750 km;Extra fare/km: 12km"),
                  _termsConditionWidget(
                      "Toll/State Tax,Parking fee,etc. executed"),
                  _termsConditionWidget("Approximate one way toll price 288"),
                  _termsConditionWidget("Service Provider: Hello42cab Pvt Ltd"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Column(
                children: [
                  _detailsWidget("Included km", "750 km"),
                  _detailsWidget("Extra Fare/km", "12 km"),
                  _detailsWidget("Driver Allowance", "Included"),
                  _detailsWidget("Fuel Charges", "Included"),
                  _detailsWidget("One pickup & One drop", "Included"),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Important Info",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  _importantInfoWidget(
                      "Guest will have to pay the parking fee, Toll/State Tax & other similar charges directly to the driver at the point of payment"),
                  _importantInfoWidget(
                      "Guest will have to pay the parking fee, Toll/State Tax & other similar charges directly to the driver at the point of payment"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsWidget(String value1, String value2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value1,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            Text(
              value2,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _termsConditionWidget(String value) {
    return Row(
      children: [
        const CircleAvatar(
          maxRadius: 4,
          backgroundColor: buttonPrimaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _importantInfoWidget(String value) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: buttonPrimaryColor,
                maxRadius: 4,
              ),
              Flexible(
                child: Text(
                  value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _importantInfoWidget2(String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 4,
              backgroundColor: buttonPrimaryColor,
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            value,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class InforPopupOverView extends StatelessWidget {

   final double  height;
    const InforPopupOverView(this.height, {super.key});

  //const InforPopupOverView(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        //boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: Icon(
          Icons.info_outline,
          color: buttonPrimaryColor,
        ),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.top,
            width: 340, //MediaQuery.of(context).size.width * 50,
            height: height,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  
  
  const ListItems({Key? key}) : super(key: key);

  Widget _termsConditionWidget(String value) {
    return Row(
      children: [
        const CircleAvatar(
          maxRadius: 4,
          backgroundColor: buttonPrimaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _importantInfoWidget(String value) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: buttonPrimaryColor,
                maxRadius: 4,
              ),
              Flexible(
                child: Text(
                  value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _importantInfoWidget2(String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 4,
              backgroundColor: buttonPrimaryColor,
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            value,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _detailsWidget(String value1, String value2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value1,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            Text(
              value2,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

/*
  Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(

*/

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SizedBox(
          //height: MediaQuery.of(context).size.height,
          child: Card(
            surfaceTintColor: Colors.white,
            child: Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Terms & conditions ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //toggleCard();
                          },
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _termsConditionWidget(
                            "Incuded km:750 km;Extra fare/km: 12km"),
                        _termsConditionWidget(
                            "Toll/State Tax,Parking fee,etc. executed"),
                        _termsConditionWidget(
                            "Approximate one way toll price 288"),
                        _termsConditionWidget(
                            "Service Provider: Hello42cab Pvt Ltd"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Column(
                      children: [
                        _detailsWidget("Included km", "750 km"),
                        _detailsWidget("Extra Fare/km", "12 km"),
                        _detailsWidget("Driver Allowance", "Included"),
                        _detailsWidget("Fuel Charges", "Included"),
                        _detailsWidget("One pickup & One drop", "Included"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Important Info",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Column(
                      children: [
                        _importantInfoWidget(
                            "Guest will have to pay the parking fee, Toll/State Tax & other similar charges directly to the driver at the point of payment"),
                        _importantInfoWidget(
                            "Guest will have to pay the parking fee, Toll/State Tax & other similar charges directly to the driver at the point of payment"),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        )
        /*
      ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute<SecondRoute>(
                    builder: (context) => SecondRoute(),
                  ),
                );
            },
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry A')),
            ),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child: Text('Entry B')),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Entry C')),
          ),

        ],
      ),
*/

        );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
