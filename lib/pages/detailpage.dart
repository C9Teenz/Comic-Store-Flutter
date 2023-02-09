import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/Models/comicmodel.dart';
import 'package:komik_store/controllers/cart_controller.dart';
import 'package:komik_store/controllers/comic_controller.dart';
import 'package:komik_store/themes/theme.dart';

import '../widgets/custom_button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    ComicController comicdetail = Get.find();
    final int uid = Get.arguments;
    final ComicModel comic = comicdetail.getUserByID(uid);
    Widget header() {
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.27,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(comic.image), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 66, left: 16),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black.withOpacity(0.2)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back_ios),
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.name,
                    style: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    comic.creator,
                    style: secondaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '${comic.rating} ',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                      Text(
                        ' (123 Users)',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget stock() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 8,
              color: kContainerColor,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Price',
                          style: secondaryTextStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(comic.price),
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Availability',
                          style: secondaryTextStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${comic.stock} In Stock',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: kContainerColor,
            ),
          ],
        ),
      );
    }

    Widget paragraph() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    comic.description,
                    style: secondaryTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: kContainerColor,
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomButton(
                  title: "Add Cart",
                  bgColor: kBlueColor,
                  textStyle: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                  onPressed: () {
                    cart.addComicToCart(uid);
                  })),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [header(), stock(), paragraph(), button()],
      ),
    );
  }
}
