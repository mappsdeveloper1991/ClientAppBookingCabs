import 'package:bookingcab_mobileapp/AppStyle/AppColors.dart';
import 'package:bookingcab_mobileapp/AppStyle/AppHeadreApp.dart';
import 'package:flutter/material.dart';

class DriverDetails extends StatefulWidget {
  const DriverDetails({super.key});

  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleHeaderBar(context, "Booking Cabs"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 95,
                  height: 400,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/images/location_image.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _driverDetailCard()
              ],
            ),
          ),
        ));
  }

  Widget _driverDetailCard() {
    return SizedBox(
      height: 335,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),

            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage("assets/images/driver-icon-27013.png"),
                    height: 70, // Set the desired height
                    width: 70, // Set the desired width
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mohit Jain",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "+91 784689543",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Tyota Etios",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                       const Text(
                        "DL 04 4465",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        
                        width: 150,
                       // height: 100,
                        //height: MediaQuery.of(context).size.height * .10,
                        child: Image.asset(
                          "assets/images/dsire_car.jpg",
                          fit: BoxFit.contain,
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
                      const Divider(
                        height: 0.5,
                        color: Colors.grey,
                      ),
          
           const SizedBox(
                        height: 20,
                      ),
            Container(
              height: 150,
              child:  const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              
                  Column(
                    children: <Widget>[
                      Icon(Icons.call, size: 62,),
                       Text(
                        "Call Driver",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),

                      Column(
                    children: <Widget>[
                      Icon(Icons.star, size: 62,),
                       Text(
                        "Rate Driver",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),


                      Column(
                    children: <Widget>[
                      Icon(Icons.share, size: 62,),
                       Text(
                        "Share Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                    ],
                  )

              ])
              
            )

          ],
        ),
      ),
    );
  }
}
