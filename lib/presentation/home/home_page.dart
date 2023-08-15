import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ihun_food_app/core/app_asset.dart';
import 'package:ihun_food_app/presentation/home/widgets/food_banner_carousel.dart';
import 'package:ihun_food_app/presentation/home/widgets/grid_category_food.dart';

import 'widgets/app_title_row.dart';
import 'widgets/food_view_horizonal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const FoodBannerCarousel(),
              const GridCategoryFood(),
              const AppTileRow(title: 'Featured Today'),
              const FoodViewHorizonal(),
              SizedBox(height: 100.h)
            ],
          ),
        ));
  }
}
