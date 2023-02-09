import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/themes/theme.dart';

class CustomCart extends StatelessWidget {
  final Function() onPressed;
  final String image;
  final String title;
  final String author;
  final double rating;
  final int price;
  final int quantity;
  const CustomCart(
      {super.key,
      required this.author,
      required this.image,
      required this.price,
      required this.quantity,
      required this.rating,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(right: 12),
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(color: kContainerColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 91,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
            ),
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
                    height: 4,
                  ),
                  Text(
                    author,
                    style: secondaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(price),
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 24,
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kContainerColor, width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                            Text('$quantity'),
                            Container(
                              width: 22,
                              height: 24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kContainerColor, width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
