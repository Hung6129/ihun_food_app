import 'package:flutter/material.dart';
import 'package:ihun_food_app/config/styles/text_styles.dart';

class AppBtnLabel extends StatelessWidget {
  const AppBtnLabel({
    super.key,
    required this.label,
    required this.labelColor,
    required this.bgColor,
    required this.iconData,
    required this.shape,
    required this.onPressed,
    required this.iconColor,
  });

  final String label;
  final Color labelColor;
  final Color bgColor;
  final IconData iconData;
  final Color iconColor;
  final OutlinedBorder shape;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: shape,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyles.defaultStyle.bold.setColor(labelColor),
      ),
    );
  }
}
