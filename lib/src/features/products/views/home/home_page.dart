import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/app_title_row.dart';
import 'widgets/food_banner_carousel.dart';
import 'widgets/food_view_horizonal.dart';
import 'widgets/grid_category_food.dart';

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
          leading:
              //Todo: Change to CircleAvatar and onTap function to navigate to the page [ProfilePage]
              IconButton(
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
