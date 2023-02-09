import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:komik_store/routes/routes.dart';
import 'package:komik_store/themes/theme.dart';

class CustomCardComicH extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String creator;
  final double rating;
  final int price;

  const CustomCardComicH({
    super.key,
    required this.image,
    required this.name,
    required this.creator,
    required this.rating,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.detail, arguments: id),
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 164,
        height: 319,
        child: Column(
          children: [
            Container(
              width: 164,
              height: 219,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  creator,
                  style: secondaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/star.png'),
                        ),
                      ),
                    ),
                    Text(
                      '$rating',
                      style: secondaryTextStyle.copyWith(
                          fontWeight: regular, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(price),
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
