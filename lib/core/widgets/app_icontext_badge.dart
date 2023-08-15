import 'package:flutter/material.dart';
import 'package:ihun_food_app/config/styles/text_styles.dart';

class AppTextBadge extends StatelessWidget {
  const AppTextBadge(
      {super.key,
      required this.label,
      required this.icon,
      required this.color});

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.customStyle.blackText.bold),
          Icon(icon, color: color),
        ],
      ),
    );
  }
}
