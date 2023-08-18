import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/styles/text_styles.dart';
import '../../../../../core/app_asset.dart';

class GridCategoryFood extends StatelessWidget {
  const GridCategoryFood({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //Todo: Add onTap function to navigate to the page [CategoryFoodListPage]
        //Todo: Make it more reusable by using GridView.builder
        GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(15),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.friedChicken,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Chicken',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.steak,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Steak',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.pizza,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pizza',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.noddle,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Noddle',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.salad,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Salad',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.iceCream,
                height: 50.h,
                width: 50.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ice Cream',
                style: TextStyles.customStyle.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
