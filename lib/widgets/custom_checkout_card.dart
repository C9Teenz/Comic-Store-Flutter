import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/themes/theme.dart';

class CustomCheckout extends StatelessWidget {
  final String image;
  final String title;

  final int price;
  final int quantity;
  const CustomCheckout({
    super.key,
    required this.image,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: kContainerColor, width: 4),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 61,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
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
                    )
                  ],
                ),
              ),
              Text(
                '${quantity}X',
                style: italicTextStyle.copyWith(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
