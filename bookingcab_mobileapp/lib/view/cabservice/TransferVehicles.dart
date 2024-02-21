import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:bookingcab_mobileapp/view/cabservice/FilterVehicle.dart';
import 'package:bookingcab_mobileapp/view/cabservice/SelectedVehicleDetails.dart';
import 'package:flutter/material.dart';

class TransferVehicles extends StatefulWidget {
  const TransferVehicles({super.key});

  @override
  State<TransferVehicles> createState() => _TransferVehiclesState();
}

class _TransferVehiclesState extends State<TransferVehicles> {
  int selectedIndex = -1;

  void updateMessage(int selectedIndex) {
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleHeaderBar(context, "Airport Transfer"),
      body: Column(
        children: [
          const _headerDetails(),
          const Divider(
            color: buttonPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "No of Results: 12",
                  style: TextStyle(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FilterVehicle()),
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                      flex: 4,
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/economy.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const VerticalDivider(
                            color: Color.fromARGB(255, 230, 227, 227),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    _circleWithText(Icons.person, "5"),
                                    _circleWithText(Icons.business_center, "1"),
                                    _circleWithTextImage(
                                        "assets/images/AC.png", "AC"),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\u{20B9} 5000',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'inc of Taxes',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: buttonPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            "27 MIN",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.speed,
                                            color: buttonPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "14 KM",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
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
                color: Color.fromARGB(255, 230, 227, 227),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomDataOfVehicleCard(
                      Icons.currency_rupee,
                      "Fare Rules",
                    ),
                    _bottomDataOfVehicleCard(
                      Icons.my_location,
                      "Meeting Point",
                    ),
                    _bottomDataOfVehicleCard(
                      Icons.policy,
                      "Cancellation Policy",
                    ),
                    _bottomDataOfVehicleCard(
                      Icons.wine_bar,
                      "Amenities",
                    ),
                  ],
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              // ),
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
            maxRadius: 10,
            child: Icon(
              icon,
              size: 12,
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
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
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
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
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
        maxRadius: 12,
        child: _widget,
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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
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
            const Expanded(
              child: Column(
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
                    "Pickup Address1, Add,Pickup Address1, Add",
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
            Column(
              children: [
                const Text(
                  "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
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
          ],
        )
        //header(),
        );
  }
}
