import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String image;
  const CustomBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    );
  }
}
