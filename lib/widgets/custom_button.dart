import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final TextStyle? textStyle;
  final Color bgColor;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.textStyle,
      required this.bgColor,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: Text(title, style: textStyle),
      ),
    );
  }
}
