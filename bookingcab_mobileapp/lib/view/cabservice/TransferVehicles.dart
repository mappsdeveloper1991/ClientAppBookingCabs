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
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/economy.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const VerticalDivider(
                            //color: Color.fromARGB(255, 230, 227, 227),
                            color: Color.fromARGB(255, 242, 236, 236),
                            thickness: 1,
                          ),
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
                                    _circleWithText(Icons.person, "5"),
                                    _circleWithText(Icons.business_center, "1"),
                                    _circleWithTextImage(
                                        "assets/images/AC.png", "AC"),
                                  ],
                                ),
                              ],
                            ),
                            const Expanded(
                              flex: 4,

                              //padding: EdgeInsets.only(right: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\u{20B9} 5,000',
                                        style: TextStyle(
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
                                            "27 MIN",
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
                                          Icon(
                                            Icons.speed,
                                            color: buttonPrimaryColor,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "14 KM",
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
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomDataOfVehicleCard(
                      Icons.currency_rupee,
                      "Fare",
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

class _headerDetails extends StatelessWidget {
  const _headerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
