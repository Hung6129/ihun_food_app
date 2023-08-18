import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/styles/text_styles.dart';

class AppTextFeild extends StatefulWidget {
  const AppTextFeild({
    super.key,
    required this.controller,
    required this.lblText,
    required this.iconData,
    this.txtfType = 'text',
    required this.onChange,
  });
  final Function(String value) onChange;
  final String txtfType;
  final TextEditingController controller;
  final String lblText;
  final IconData iconData;

  @override
  State<AppTextFeild> createState() => _AppTextFeildState();
}

class _AppTextFeildState extends State<AppTextFeild> {
  bool _passVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextField(
        onChanged: widget.onChange,
        controller: widget.controller,
        obscureText: widget.txtfType == 'password' ? _passVisibility : false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconData),
          suffixIcon: widget.txtfType == 'password'
              ? IconButton(
                  icon: Icon(
                    _passVisibility == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    _passVisibility = !_passVisibility;
                    setState(() {});
                  },
                )
              : ClearButton(controller: widget.controller),
          labelText: widget.lblText,
          labelStyle: TextStyles.customStyle,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          controller.clear();
        },
      );
}
