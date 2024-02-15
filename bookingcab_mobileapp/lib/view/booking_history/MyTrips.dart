import 'package:bookingcab_mobileapp/view/booking_history/TripCompleted.dart';
import 'package:flutter/material.dart';

import '../AppStyle/AppHeadreApp.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Completed"),
              ),
              Tab(
                child: Text("Upcoming"),
              ),
              Tab(
                child: Text("Cancel"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: TripCompleted(),
            ),
            Center(
              child: TripCompleted(),
            ),
            Center(
              child: TripCompleted(),
            ),
          ],
        ),
      ),
    );
  }
}
