import 'package:flutter/material.dart';

import '../../../../../config/styles/text_styles.dart';
import '../../product/feature_food_list_page.dart';

class AppTileRow extends StatelessWidget {
  const AppTileRow({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.defaultStyle.bold.largeText,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeatureFoodListPage(),
                  ),
                );
              },
              child: Text('See all',
                  style: TextStyles.defaultStyle.smallText.underLine)),
        ],
      ),
    );
  }
}
