import 'dart:convert';

import 'package:bookingcab_mobileapp/AppStyle/Loader.dart';
import 'package:bookingcab_mobileapp/comman/ShowToast.dart';
import 'package:bookingcab_mobileapp/data/localDB/GlobalValue.dart';
import 'package:bookingcab_mobileapp/data/remoteServer/HttpAPIRequest.dart';
import 'package:bookingcab_mobileapp/view/booking_history/BookingListAPIResponseData.dart';
import 'package:flutter/material.dart';

class TripCompleted extends StatefulWidget {
  
  const TripCompleted({super.key});

  @override
  State<TripCompleted> createState() => _TripCompletedState();
}

class _TripCompletedState extends State<TripCompleted> {


  @override
  void initState() {
    super.initState();
     getBookingList();
  }

 List<BookingDetails> bookingListData = [];
Future<void> getBookingList() async {
   Map<String, Object> queryParams = {
       
      };
      //showCustomeLoader(context);
      try {
        final response = await postRequest(BOOKING_LIST_API_ENDPOINT_NAME+"340b26cb68ad51a74c6a1b2bdb70d00aaa5cf07848da4f0210c07aa3a161dc33", queryParams);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = BookingListAPIResponseData.fromJson(jsonData['responsedata']);
          //hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
              setState(() {
                bookingListData = responseData.bookingList;
              });
          }else{
               //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          // Handle error response
          //hideCustomeLoader(context);
          showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle exceptions
        //hideCustomeLoader(context);
        //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bookingListData.length,
      itemBuilder: (context, index) {
        return _tripCard(bookingListData[index]);
      },
    );
  }

}


/*
extends StatefulWidget {
  const LanguageSelectScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  String? selectedLanguage;
 late List<Language>?  languageListData = [];


@override
  void initState() {
    super.initState();
     // getLanguageListAPICall();
  }

Future<void> getLanguageListAPICall() async {
  
      //showCustomeLoader(context);
      try {
        final response = await getRequest(LanguageAPI_END_POINT);
        if (response.statusCode == 200) {
          print('Response: ${response.body}');
          final jsonData = jsonDecode(response.body);
          var responseData = LanguageResponseData.fromJson(jsonData);
          //hideCustomeLoader(context);
          if (responseData.status == SUCCESS_STATUS) {
              setState(() {
                languageListData = responseData.languageListData;
              });
          }else{
               //showSuccessTost(context, responseData.message ?? "$SOMETHING_WENT_WRONG_MSG");
          }
        } else {
          // Handle error response
          //hideCustomeLoader(context);
          //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        // Handle exceptions
        //hideCustomeLoader(context);
        //showErrorTost(context, "$SOMETHING_WENT_WRONG_MSG");
        print('Exception occurred: $e');
      }
  }



  @override
  Widget build(BuildContext context) {
*/









class _tripCard extends StatelessWidget {
  final BookingDetails details;
   const _tripCard(this.details,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:  Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${details.bookingTime} From: ${details.pickupArea}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${details.dropTime} From: ${details.dropArea}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Date: ${details.bookingDate}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
