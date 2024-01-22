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

List<PackageDetail> packageList = [
  PackageDetail(from: 'Jaipur', to: "Delhi", amount: 2460),
  PackageDetail(from: 'Delhi', to: "Jaipur", amount: 3000),
  PackageDetail(from: 'Delhi', to: "Shimla", amount: 4000),
  PackageDetail(from: 'Agra', to: "Jaipur", amount: 3500),
  PackageDetail(from: 'Jaipur', to: "Agra", amount: 6000),
];

List<Map> offerList = [
  {"image": "assets/images/car.jpeg", "title": "Luxary Car"},
  {
    "image": "assets/images/international.jpeg",
    "title": "Vehicle for International Destination"
  },
  {"image": "assets/images/car.jpeg", "title": "Luxary Car"},
  {
    "image": "assets/images/international.jpeg",
    "title": "Vehicle for International Destination"
  },
  {"image": "assets/images/car.jpeg", "title": "Luxary Car"}
];

List<Map> hotelofferList = [
  {"image": "assets/images/hotel_img1.jpg", "title": "10"},
  {"image": "assets/images/hotel_img2.jpg", "title": "20"},
  {"image": "assets/images/hotel_img3.jpg", "title": "15"},
  {"image": "assets/images/hotel_img2.jpg", "title": "20"},
  {"image": "assets/images/hotel_img3.jpg", "title": "15"}
];

List<Map> thingTodoList = [
  {"image": "assets/images/package_img1.jpeg", "title": "70991"},
  {"image": "assets/images/package_img2.jpeg", "title": "5600"},
  {"image": "assets/images/package_img3.jpeg", "title": "70000"},
  {"image": "assets/images/package_img1.jpeg", "title": "70991"},
  {"image": "assets/images/package_img1.jpeg", "title": "70991"}
];
