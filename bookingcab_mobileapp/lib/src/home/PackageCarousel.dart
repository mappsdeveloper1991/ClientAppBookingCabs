// Import the necessary class for PackageDetails
import 'package:bookingcab_mobileapp/src/home/HomeTabScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PackageCarousel extends StatefulWidget {
  const PackageCarousel({Key? key}) : super(key: key);

  @override
  State<PackageCarousel> createState() => _PackageCarouselState();
}

class _PackageCarouselState extends State<PackageCarousel> {
  late PageController pageController;

  List<PackageDetails> packageList = [
    PackageDetails(
      image: "assets/images/package_img1.jpeg",
      packageAmount: 70991,
    ),
    PackageDetails(
      image: "assets/images/package_img1.jpeg",
      packageAmount: 70992,
    ),
    PackageDetails(
      image: "assets/images/package_img1.jpeg",
      packageAmount: 70993,
    ),
    PackageDetails(
      image: "assets/images/package_img1.jpeg",
      packageAmount: 70994,
    ),
    // PackageDetails(
    //   image: "assets/images/package_img1.jpeg",
    //   packageAmount: 70995,
    // ),
    // PackageDetails(
    //   image: "assets/images/package_img1.jpeg",
    //   packageAmount: 70996,
    // ),

    // Add more PackageDetails as needed
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    int len = (packageList.length / 2).toInt();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 210,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: len,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _packageWidget(
                      packageList: packageList,
                      width: width,
                      index: index,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: _packageWidget(
                      packageList: packageList,
                      width: width,
                      index: index,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: (packageList.length / 2).toInt(),
          effect: const WormEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.lightBlueAccent,
            dotHeight: 9,
            dotWidth: 9,
          ),
        )
      ],
    );
  }
}

class _packageWidget extends StatelessWidget {
  const _packageWidget({
    super.key,
    required this.packageList,
    required this.width,
    required this.index,
  });

  final List<PackageDetails> packageList;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red, // Set your border color here
          width: 2.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(packageList[index].image!),
              width: width * .50,
              height: 185,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "INR ${packageList[index].packageAmount}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width / 35,
              ),
              const ColoredBox(
                color: Colors.black,
                child: SizedBox(
                  height: 21,
                  width: 2,
                ),
              ),
              SizedBox(
                width: width / 35,
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
        ],
      ),
    );
  }
}
