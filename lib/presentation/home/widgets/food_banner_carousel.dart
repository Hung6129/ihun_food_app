import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_food_app/core/app_asset.dart';

class FoodBannerCarousel extends StatefulWidget {
  const FoodBannerCarousel({super.key});

  @override
  State<FoodBannerCarousel> createState() => _FoodBannerCarouselState();
}

class _FoodBannerCarouselState extends State<FoodBannerCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      AppAsset.foodBanner1,
      AppAsset.foodBanner2,
      AppAsset.foodBanner3,
      AppAsset.foodBanner4,
      AppAsset.foodBanner5,
      AppAsset.foodBanner6,
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 300.w,
                  height: 200.h,
                ),
              ),
            ))
        .toList();
    return SizedBox(
      height: 200.h,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.w,
                height: 8.h,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(
                    _current == entry.key ? 0.9 : 0.4,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
