import 'package:bookingcab_mobileapp/view/booking_history/MyTrips.dart';
import 'package:bookingcab_mobileapp/view/home/HomeTabScreen.dart';
import 'package:bookingcab_mobileapp/view/profile/MyAccount.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../AppStyle/AppColors.dart';
import '../../AppStyle/AppHeadreApp.dart';
import '../../comman/Constant.dart';

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
      appBar: homePageHeaderBar(context, selectedLocation),
      body: SafeArea(
        child: Column(
          children: [
            //toNavBar(),
            Expanded(
              child: TabBarView(
                controller: homeTabController,
                children: const [
                  MyTrips(),
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

  AppBar homePageHeaderBar(BuildContext context, String? selectedLocation) {
    return AppBar(
        // toolbarHeight: 65,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        shadowColor:primaryColor,
        elevation: 5,
        toolbarOpacity: 1,
        // elevation: 2,
        title:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // bookingCabsTextLogo(context)
               SizedBox(height: 5,),
             SizedBox(
              //height: 40,
              //child: Text("Ok"),
               child: Image(
                image: AssetImage("assets/images/bookingcbas_logo.png"),
               fit: BoxFit.fitHeight,
                ),
             ),
           // SizedBox(height: 5,),
            Text(selectedLocation ?? "", style: TextStyle( fontSize: 10, color: blackColor, fontWeight: FontWeight.bold, ),),
            SizedBox(height: 5,)

          ],
        ),

      
        //centerTitle: true,
        actions: <Widget>[
          Row(
            children: [
              const Icon(
                Icons.notifications,
                size: 30,
              ),
              const SizedBox(width: 10), // Added SizedBox for spacing
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: const Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10), // Added SizedBox for spacing
              /* Container(
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
              ), */
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
      padding: const EdgeInsets.only(
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
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.red,
        backgroundColor: whiteColor,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              size: 25,
            ),
            label: "My Trips",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.currency_rupee_rounded,
              size: 25,
            ),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house,
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sell,
              size: 25,
            ),
            label: "Refer & Earn",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.headset_mic,
              size: 25,
            ),
            label: "Support",
          ),
        ],
      ),
    );
  }
}
