import 'package:bookingcab_mobileapp/view/cabservice/TransferService.dart';
import 'package:bookingcab_mobileapp/view/home/DualImageCarosel.dart';
import 'package:flutter/material.dart';

import '../comman/Constant.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 112,
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
                      height: 10,
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
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 300,
                            child: Row(
                              children: [
                                Expanded(
                                    child:
                                        PackageTable(packageList: packageList)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 8,
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
                                  fontSize: 18,
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
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "We Offer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Great Hotels",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
      width: 90,
      height: 112,
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
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(icon, size: 32),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
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

class PackageTable extends StatefulWidget {
  const PackageTable({super.key, required this.packageList});

  final List<PackageDetail> packageList;

  @override
  State<PackageTable> createState() => _PackageTableState();
}

class _PackageTableState extends State<PackageTable> {
  bool isTableExpanded = true;

  void toggleTableExpansion() {
    setState(() {
      isTableExpanded = !isTableExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 5,
      columnSpacing: 35,
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black),
      columns: [
        const DataColumn(
          label: Text(
            'From',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          // numeric: true,
        ),
        const DataColumn(
          label: Text(
            'To',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          // numeric: true,
        ),
        const DataColumn(
          label: ColoredBox(
            color: Colors.orangeAccent,
            child: Padding(
              padding: EdgeInsets.only(right: 10, left: 10, top: 1, bottom: 1),
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // numeric: true,
        ),
        DataColumn(
          label: IconButton(
            icon: Icon(
              isTableExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.white,
            ),
            onPressed: () {
              toggleTableExpansion();
            },
          ),
          numeric: true,
        ),
      ],
      rows: [
        if (isTableExpanded)
          for (int i = 0; i < widget.packageList.length; i++)
            DataRow(
              cells: [
                DataCell(
                  Text(
                    widget.packageList[i].from,
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
                    widget.packageList[i].to,
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
                    '\u{20B9} ${widget.packageList[i].amount}',
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
                          right: 10, left: 10, top: 1, bottom: 1),
                      child: Text(
                        maxLines: 1,
                        'Book Now',
                        style: TextStyle(
                          fontSize: 15,
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
    );
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
                        "Book Now",
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
