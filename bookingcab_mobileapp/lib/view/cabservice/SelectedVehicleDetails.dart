import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:flutter/material.dart';

class SelectedVehicleDetails extends StatefulWidget {
  const SelectedVehicleDetails({super.key});

  @override
  State<SelectedVehicleDetails> createState() => _SelectedVehicleDetailsState();
}

class _SelectedVehicleDetailsState extends State<SelectedVehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 207, 207),
      appBar: simpleHeaderBar(context, "Airport Transfer"),
      body: Column(
        children: [
          const _headerDetails(),
          //  const Divider(),
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
                      ),
                      _driverDetailCard(),
                      _otherFairDetailCard(
                        "Guide",
                        "Hindi UnderStanding...",
                      ),
                      _otherFairDetailCard(
                        "Attraction",
                        "Light and Sound Show..",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                              backgroundColor:
                                  buttonPrimaryColor, // buttonSecondaryColor, // Adjust according to your theme
                              shape: const RoundedRectangleBorder(),
                            ),
                            onPressed: () {},
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
        ],
      ),
    );
  }

  Widget _carDetailCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 70,
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
                const Row(
                  children: [
                    Text(
                      '\u{20B9} 5000',
                      style: TextStyle(
                        color: buttonPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.info,
                      color: buttonPrimaryColor,
                    ),
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

  Widget _otherFairDetailCard(String value1, String value2) {
    return SizedBox(
      height: 70,
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
              const Row(
                children: [
                  Text(
                    '\u{20B9} 5000',
                    style: TextStyle(
                      color: buttonPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.info,
                    color: buttonPrimaryColor,
                  ),
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
      height: 135,
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
                        '\u{20B9} 5000',
                        style: TextStyle(
                          color: buttonPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.info,
                        color: buttonPrimaryColor,
                      ),
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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "- Night Charge Extra",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "- Meal Extra",
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
          ],
        ),
      ),
    );
  }
}

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
