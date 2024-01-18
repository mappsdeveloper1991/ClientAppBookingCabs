import 'dart:ffi';

import 'package:bookingcab_mobileapp/src/home/searchbar_app.dart';
import 'package:flutter/material.dart';

import 'slider_carousel.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  String? selectedLocation = 'Delhi-NCR'; // Use String instead of Text

  var items = [
    "Delhi-NCR",
    "Gurgaon-NCR", // Corrected the spelling
    "Noida-UP", // Corrected the spelling
  ];

  List<HomeCardDetails> cardList = [
    HomeCardDetails(icon: Icons.local_taxi, label: "Local Hire"),
    HomeCardDetails(icon: Icons.location_on, label: "City Cab"),
    HomeCardDetails(icon: Icons.flight_takeoff, label: "Transfer"),
    HomeCardDetails(icon: Icons.local_airport_sharp, label: "Outstation"),
    HomeCardDetails(icon: Icons.abc_outlined, label: "Card 5"),
  ];

  List<PackageDetails> packageList = [
    PackageDetails(
        image: "assets/images/package_img1.jpeg", packageAmount: 70992),
    PackageDetails(
        image: "assets/images/package_img1.jpeg", packageAmount: 70992),
    PackageDetails(
        image: "assets/images/package_img1.jpeg", packageAmount: 70992),
    PackageDetails(
        image: "assets/images/package_img1.jpeg", packageAmount: 70992),
  ];

  TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cardList.length,
              itemBuilder: (BuildContext context, int index) => CustomCard(
                  icon: cardList[index].icon!,
                  label: "${cardList[index].label}"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.yellow,
                  width: 2,
                ),
              ),
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
                          // Handle search query changes
                          // Implement your search logic here
                          _isSearchFocused = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                  _isSearchFocused
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              // Clear search functionality
                              // Implement your logic here
                              _searchController.clear();
                              _isSearchFocused = false;
                            });
                          },
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          const Row(
            children: [
              Expanded(
                child: SliderCarosel(),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: packageList.length,
              itemBuilder: (BuildContext context, int index) => PackageCard(
                image: packageList[index].image!,
                packageAmount: packageList[index].packageAmount,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: packageList.length,
              itemBuilder: (BuildContext context, int index) => PackageCard(
                image: packageList[index].image!,
                packageAmount: packageList[index].packageAmount,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String label;

  CustomCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: Icon(icon, size: 40),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  PackageCard({required this.image, required this.packageAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 180,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

// Widget searchBar() {
//   return SearchAnchor(
//     builder: (BuildContext context, SearchController controller) {
//       return SearchBar(
//         controller: controller,
//         padding: const MaterialStatePropertyAll<EdgeInsets>(
//             EdgeInsets.symmetric(horizontal: 16.0)),
//         onTap: () {
//           controller.openView();
//         },
//         onChanged: (_) {
//           controller.openView();
//         },
//         leading: const Icon(Icons.search),
//         trailing: <Widget>[
//           Tooltip(
//             message: 'Change brightness mode',
//             child: IconButton(
//               isSelected: isDark,
//               onPressed: () {
//                 setState(() {
//                   isDark = !isDark;
//                 });
//               },
//               icon: const Icon(Icons.wb_sunny_outlined),
//               selectedIcon: const Icon(Icons.brightness_2_outlined),
//             ),
//           )
//         ],
//       );
//     },
//     suggestionsBuilder: (BuildContext context, SearchController controller) {
//       return List<ListTile>.generate(5, (int index) {
//         final String item = 'item $index';
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             setState(() {
//               controller.closeView(item);
//             });
//           },
//         );
//       });
//     },
//   );
// }


