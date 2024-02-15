import 'package:bookingcab_mobileapp/view/home/HomeTabScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DualImageCarosel extends StatefulWidget {
  const DualImageCarosel({
    super.key,
    required this.dataList,
    required this.cardBuilder,
  });

  final List dataList;
  final Widget Function(String imageUrl, String title) cardBuilder;

  @override
  State<DualImageCarosel> createState() => _DualImageCaroselState();
}

class _DualImageCaroselState extends State<DualImageCarosel> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.dataList.length,
            itemBuilder: (context, index) {
              final item = widget.dataList[index];
              final startIndex = index * 2;
              final endIndex = startIndex + 1;
              return Row(
                children: [
                  Expanded(
                    child: widget.cardBuilder(
                      widget.dataList[startIndex]['image']!,
                      widget.dataList[startIndex]['title']!,
                    ),
                  ),
                  if (endIndex < widget.dataList.length)
                    Expanded(
                      child: widget.cardBuilder(
                        widget.dataList[endIndex]['image']!,
                        widget.dataList[endIndex]['title']!,
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
          count: (widget.dataList.length / 2).ceil(), //offerImages.length,
          effect: const WormEffect(
              activeDotColor: Colors.blue,
              dotColor: Colors.lightBlueAccent,
              dotHeight: 9,
              dotWidth: 9),
        ),
      ],
    );
  }
}
