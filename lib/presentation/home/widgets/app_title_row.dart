import 'package:flutter/material.dart';
import 'package:ihun_food_app/config/styles/text_styles.dart';

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
            style: TextStyles.defaultStyle.bold.mediumText,
          ),
          Text('See all', style: TextStyles.defaultStyle.smallText.underLine),
        ],
      ),
    );
  }
}
