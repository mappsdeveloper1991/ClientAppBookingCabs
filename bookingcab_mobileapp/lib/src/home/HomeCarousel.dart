import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../comman/Constant.dart';

class SliderCarosel extends StatefulWidget {
  const SliderCarosel({super.key});

  @override
  State<SliderCarosel> createState() => _SliderCaroselState();
}

class _SliderCaroselState extends State<SliderCarosel> {
  late PageController pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 1;
    return Column(

      children: [
        SizedBox(
          height: 185,
          width: MediaQuery.of(context).size.width * 0.95,

          child: PageView.builder(

            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: offerImages.length,
            itemBuilder: (context, index) {
             return ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(offerImages[index], fit: BoxFit.cover),

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
