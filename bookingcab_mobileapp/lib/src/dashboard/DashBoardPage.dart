import 'package:bookingcab_mobileapp/src/home/HomeTabScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AppStyle/AppColors.dart';
import '../AppStyle/AppHeadreApp.dart';
import '../comman/Constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController homeTabController;
  String? selectedLocation = 'Delhi-NCR'; // Use String instead of Text


  @override
  void initState() {
    super.initState();
    homeTabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 2, // Set the initial index to match the HomeTabScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageHeaderBar(context),
      body: SafeArea(
        child: Column(
          children: [
            //toNavBar(),
            Expanded(
              child: TabBarView(
                controller: homeTabController,
                children: const [
                  Icon(Icons.format_list_bulleted),
                  Icon(Icons.currency_rupee_rounded),
                  HomeTabScreen(),
                  Icon(Icons.earbuds_battery_outlined),
                  Icon(Icons.support_agent),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          HomeBottomNavigationBar(homeNavBarController: homeTabController),
    );
  }


  AppBar homePageHeaderBar(BuildContext context) {
    return
      AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 2,
        title: //Text("Home Page"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            bookingCabsTextLogo(context)
          ],
        ),
        //centerTitle: true,
        actions: <Widget>[
          Row(
            children: [
              const Icon(
                Icons.notifications,
              ),
              const SizedBox(width: 10), // Added SizedBox for spacing
              const Icon(
                Icons.person,
              ),
              const SizedBox(width: 10), // Added SizedBox for spacing
              Container(
                height: 30,
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                  bottom: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    // Changed DropdownMenu to DropdownButton
                    value: selectedLocation,
                    items: cityListItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                    dropdownColor: Colors.red,
                    iconEnabledColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ]);
  }

}

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({
    Key? key,
    required this.homeNavBarController,
  }) : super(key: key);

  final TabController homeNavBarController;

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // left: 10,
        // right: 10,
        // bottom: Platform.isIOS ? 24 : 10,
        top: 4,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (bottomIndex) {
          setState(() {
            currentIndex = bottomIndex;
            widget.homeNavBarController
                .animateTo(bottomIndex); // Sync the TabBarView index
          });
        },
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
            ),
            label: "My Trips",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.currency_rupee_rounded,
            ),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sell,
            ),
            label: "Refer & Earn",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.headset_mic,
            ),
            label: "Support",
          ),
        ],
      ),
    );
  }
}
