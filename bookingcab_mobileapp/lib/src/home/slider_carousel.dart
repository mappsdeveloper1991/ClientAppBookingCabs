import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderCarosel extends StatefulWidget {
  const SliderCarosel({super.key});

  @override
  State<SliderCarosel> createState() => _SliderCaroselState();
}

class _SliderCaroselState extends State<SliderCarosel> {
  late PageController pageController;

  List<String> offerImages = [
    "assets/images/offer_img1.jpeg",
    "assets/images/offer_img2.jpeg",
    "assets/images/offer_img3.jpeg",
    "assets/images/offer_img4.jpeg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 185,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: offerImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(offerImages[index]),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: offerImages.length,
          effect: const WormEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.lightBlueAccent,
              dotHeight: 9,
              dotWidth: 9),
        )
      ],
    );
  }
}
