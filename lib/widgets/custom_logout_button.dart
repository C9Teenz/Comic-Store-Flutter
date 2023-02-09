import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CustomLogoutbutton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  const CustomLogoutbutton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 46,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: kWhiteColor,
            side: BorderSide(color: kRedColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: redTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        ),
      ),
    );
  }
}
