import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/themes/theme.dart';

class CustomButtonCart extends StatelessWidget {
  final int total;
  final int item;
  final Function() button;
  const CustomButtonCart(
      {super.key,
      required this.total,
      required this.item,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kBlueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$item Item",
                style:
                    whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
              RichText(
                text: TextSpan(
                    text: 'total ',
                    style: whiteTextStyle.copyWith(fontSize: 12),
                    children: [
                      TextSpan(
                          text: NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(total),
                          style: whiteTextStyle.copyWith(
                              fontSize: 12, fontWeight: bold))
                    ]),
              )
            ],
          ),
          SizedBox(
            width: 75,
            height: 38,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: button,
              child: Text(
                'Pay Now',
                style:
                    blueTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
