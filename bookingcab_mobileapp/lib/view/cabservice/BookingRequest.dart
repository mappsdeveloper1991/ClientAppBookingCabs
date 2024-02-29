import 'dart:async';

import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:bookingcab_mobileapp/view/cabservice/DriverDetails.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BookingRequest extends StatefulWidget {
  const BookingRequest({super.key});

  @override
  State<BookingRequest> createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {
  @override
  void initState() {
    super.initState();

    //startTimer();
    //_controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 234, 234),
      appBar: simpleHeaderBar(context, "Airport Transfer"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _carDetailCard(),
          ],
        ),
      ),
    );
  }

  final int _duration = 3;
  final CountDownController _controller = CountDownController();

  Widget _carDetailCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .60,
        width: MediaQuery.of(context).size.width * .95,
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 200,
                        //height: MediaQuery.of(context).size.height * .10,
                        child: Image.asset(
                          "assets/images/dsire_car.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        "SEDAN",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: CircularCountDownTimer(
                    // Countdown duration in Seconds.
                    duration: _duration,

                    // Countdown initial elapsed Duration in Seconds.
                    initialDuration: 0,

                    // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                    controller: _controller,

                    // Width of the Countdown Widget.
                    width: 170.0, //MediaQuery.of(context).size.width / 4,

                    // Height of the Countdown Widget.
                    height: 170.0, //MediaQuery.of(context).size.height / 4,

                    // Ring Color for Countdown Widget.
                    ringColor: Colors.grey, // Colors.grey[300]!,

                    // Ring Gradient for Countdown Widget.
                    ringGradient: null,

                    // Filling Color for Countdown Widget.
                    fillColor: const Color.fromARGB(255, 240, 19,
                        3), //Colors.grey, // Colors.purpleAccent[100]!,

                    // Filling Gradient for Countdown Widget.
                    fillGradient: null,

                    // Background Color for Countdown Widget.
                    backgroundColor: Color.fromARGB(
                        255, 216, 212, 212), //Colors.purple[500],

                    // Background Gradient for Countdown Widget.
                    backgroundGradient: null,

                    // Border Thickness of the Countdown Ring.
                    strokeWidth: 30.0,

                    // Begin and end contours with a flat edge and no extension.
                    strokeCap: StrokeCap.round,

                    // Text Style for Countdown Text.
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),

                    // Format for the Countdown Text.
                    //textFormat: CountdownTextFormat.S,

                    // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                    isReverse: false,

                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                    isReverseAnimation: false,

                    // Handles visibility of the Countdown Text.
                    //isTimerTextShown: true,

                    // Handles the timer start.
                    autoStart: true,

                    // This Callback will execute when the Countdown Starts.
                    onStart: () {
                      // Here, do whatever you want
                      debugPrint('Countdown Started');
                    },

                    // This Callback will execute when the Countdown Ends.
                    onComplete: () {
                      // Here, do whatever you want
                      debugPrint('Countdown Ended');

                      openPopup();
                    },

                    // This Callback will execute when the Countdown Changes.
                    onChange: (String timeStamp) {
                      // Here, do whatever you want
                      debugPrint('Countdown Changed $timeStamp');
                    },

                    /* 
                              * Function to format the text.
                              * Allows you to format the current duration to any String.
                              * It also provides the default function in case you want to format specific moments
                                as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
                                the default behavior.
                            */
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                        // only format for '0'
                        return "Wating";
                      } else {
                        // other durations by it's default format
                        var secondx = Function.apply(
                            defaultFormatterFunction, [duration]);
                        return "$secondx Seconds"; //;
                      }
                    },
                  ),
                ),
                Container(
                  height: 0,
                ),
                Container(
                  //height: MediaQuery.of(context).size.height * .10,
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "Wating for driver to accept your request",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openPopup() {
    showDialog(
        context: context,
        //barrierColor: Color.fromARGB(255, 221, 219, 219),
barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Container(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Success',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ])),
            content: Container(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Booking Refren No: FGTE543521D ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Your Booking has been confirmed'),
                      SizedBox(
                        height: 1,
                      ),
                      Text('Driver will pickup in 30 minutes'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Note: 10 times peak charges will applicable'),
                      SizedBox(
                        height: 10,
                      ),
                    ])),
            /*
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        icon: Icon(Icons.message),
                      ),
                    ),
                  ],
                ),
              ),
            ),

*/

            actions: [
              MaterialButton(
                height: 45,
                minWidth: 340,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12)),
                onPressed: () {
                  Navigator.pop(context); 
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverDetails()),
                        );
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
            ],
          );
        });
  }
}
