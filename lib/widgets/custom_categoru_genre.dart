import 'dart:math';

import 'package:flutter/material.dart';

import 'package:komik_store/themes/theme.dart';

class CustomCategoryGenre extends StatelessWidget {
  final String name;
  final Function() button;
  const CustomCategoryGenre(
      {required this.name, required this.button, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/image 1.png',
      'assets/image 2.png',
      'assets/image 3.png',
      'assets/image 4.png',
      'assets/image 5.png',
    ];
    int min = 0;
    int max = imageList.length - 1;
    var rnd = Random();
    int i = min + rnd.nextInt(max - min);
    String image = imageList[i].toString();

    return GestureDetector(
      onTap: button,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        height: 33,
        width: 168,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.srcATop),
            )),
        child: Center(
          child: Text(
            name,
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: bold),
          ),
        ),
      ),
    );
  }
}
