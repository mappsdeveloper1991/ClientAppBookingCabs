

import 'package:flutter/material.dart';

import '../home/HomeTabScreen.dart';

var languageOptions = [
  "English",
  "Hindi  हिंदी",
  "Punjabi ਪੰਜਾਬੀ",
  "Gujarati ગુજરાતી",
  "Tamil தமிழ்",
  "Bengali বাংলা",
  "Marathi मराठी",
  "Kannada ಕನ್ನಡ"
];


var cityListItems = [
  "Delhi-NCR",
  "Gurgaon-NCR",
  "Noida-UP",
  "Panipat",
  "ChandiGarh",
  "Ambala",
  "Agra",
  "Mathura",
  "Brindaban",
  "varanasi"
];

List<HomeCardDetails> cabServiceType = [
  HomeCardDetails(icon: Icons.local_taxi, label: "Local Hire"),
  HomeCardDetails(icon: Icons.location_on, label: "City Cab"),
  HomeCardDetails(icon: Icons.flight_takeoff, label: "Transfer"),
  HomeCardDetails(icon: Icons.local_airport_sharp, label: "Outstation"),
  HomeCardDetails(icon: Icons.abc_outlined, label: "P To P"),
  HomeCardDetails(icon: Icons.abc_outlined, label: "Airport"),
];

List<PackageDetails> outStationPackageList = [
  PackageDetails(
      image: "assets/images/package_img1.jpeg", packageAmount: 70992),
  PackageDetails(
      image: "assets/images/package_img1.jpeg", packageAmount: 70992),
  PackageDetails(
      image: "assets/images/package_img1.jpeg", packageAmount: 70992),
  PackageDetails(
      image: "assets/images/package_img1.jpeg", packageAmount: 70992),
];



List<String> offerImages = [
  "assets/images/offer_img1.jpeg",
  "assets/images/offer_img2.jpeg",
  "assets/images/offer_img3.jpeg",
  "assets/images/offer_img4.jpeg",
];
