import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:flutter/material.dart';

class FilterVehicle extends StatefulWidget {
  const FilterVehicle({super.key});

  @override
  State<FilterVehicle> createState() => _FilterVehicleState();
}

class _FilterVehicleState extends State<FilterVehicle> {
  bool priceLH = false;
  bool priceHL = false;
  bool avgCustomerReviews = false;
  bool newArrival = false;
  bool hatchback = false;
  bool sedan = false;
  bool prime = false;
  bool year2018 = false;
  bool year2017 = false;
  bool year2016 = false;
  bool blackColor = false;
  bool whiteColor = false;
  bool petrol = false;
  bool diesel = false;
  bool cng = false;
  bool freeCancellation = false;
  bool tenPercentCancellation = false;
  bool twentyFivePercentCancellation = false;
  bool fiftyPercentCancellation = false;
  bool hundredPercentCancellation = false;
  bool payOnTrip = false;
  bool tenPercentAdvance = false;
  bool fifteenPercentAdvance = false;
  bool fiftyPercentAdvance = false;
  bool hundredPercentAdvance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 67, 67),
      appBar: simpleHeaderBar(context, "Filter"),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preffered Feature",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 8),
                      child: Text(
                        "Sort",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget("Price Low to High", priceLH),
                          _checkBoxDetailsWidget("Price High to Low", priceHL),
                          _checkBoxDetailsWidget(
                              "Avg. Customer Reviews", avgCustomerReviews),
                          _checkBoxDetailsWidget("New Arrival", newArrival),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget("Hatchback", hatchback),
                          _checkBoxDetailsWidget("Sedan", sedan),
                          _checkBoxDetailsWidget("Prime", prime),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Modal",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget("2018", year2018),
                          _checkBoxDetailsWidget("2017", year2017),
                          _checkBoxDetailsWidget("2016", year2016),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Color",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget("Black", blackColor),
                          _checkBoxDetailsWidget("White", whiteColor),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Fuel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget("Petrol", petrol),
                          _checkBoxDetailsWidget("Diesel", diesel),
                          _checkBoxDetailsWidget("CNG", cng),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Cancellation",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget(
                              "Free Cancellation", freeCancellation),
                          _checkBoxDetailsWidget(
                              "10% Cancellation", tenPercentAdvance),
                          _checkBoxDetailsWidget("25% Cancellation",
                              twentyFivePercentCancellation),
                          _checkBoxDetailsWidget(
                              "50% Cancellation", fiftyPercentCancellation),
                          _checkBoxDetailsWidget(
                              "100% Cancellation", hundredPercentCancellation),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, left: 8, bottom: 8),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _checkBoxDetailsWidget(
                            "Pay on Trip",
                            payOnTrip,
                          ),
                          _checkBoxDetailsWidget(
                              "10% Advance", tenPercentAdvance),
                          _checkBoxDetailsWidget(
                              "15% Advance", fifteenPercentAdvance),
                          _checkBoxDetailsWidget(
                              "50% Advance", fiftyPercentAdvance),
                          _checkBoxDetailsWidget(
                              "100% Advance", hundredPercentAdvance),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _checkBoxDetailsWidget(String value, bool cValue) {
    return Row(
      children: [
        Checkbox(
          value: cValue,
          onChanged: (val) {
            print("clicked");
            changeCheckBoxValue(value, val!);
          },
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void changeCheckBoxValue(String checkBoxName, bool value) {
    switch (checkBoxName) {
      case 'Price Low to High':
        setState(() {
          priceLH = value;
        });
      case 'Price High to Low':
        setState(() {
          priceHL = value;
        });
    }
  }
}
