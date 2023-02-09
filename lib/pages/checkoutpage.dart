import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/controllers/cart_controller.dart';
import 'package:komik_store/controllers/checkout_controller.dart';
import 'package:komik_store/controllers/comic_controller.dart';
import 'package:komik_store/themes/theme.dart';
import 'package:komik_store/widgets/custom_button.dart';
import 'package:komik_store/widgets/custom_checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final checkout = Get.put(CheckoutController());
    CartController cart = Get.find();
    ComicController comic = Get.find();
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: kSecondaryColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Checkout',
                        style: primaryTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget item() {
      return Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.38,
        child: Obx(
          () => cart.temporaryData.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  itemCount: cart.temporaryData.length,
                  itemBuilder: (context, index) {
                    return CustomCheckout(
                        image: cart.temporaryData[index].comics.image,
                        price: cart.temporaryData[index].comics.price,
                        quantity: cart.temporaryData[index].quantity,
                        title: cart.temporaryData[index].comics.name);
                  },
                ),
        ),
      );
    }

    Widget insurance() {
      return Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insurance',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kContainerColor),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/asuransi.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Commodity Insurance',
                            style: primaryTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          ),
                          Text(
                            'Protect your item so it will arrive safely',
                            style: secondaryTextStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Obx(() => Checkbox(
                          value: checkout.insurance.value,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          onChanged: (value) {
                            checkout.checkbox();
                          },
                        ))
                  ],
                ),
              ),
            ))
          ],
        ),
      );
    }

    Widget payment() {
      return Container(
        padding: const EdgeInsets.all(24),
        height: MediaQuery.of(context).size.height * 0.22,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal',
                              style: secondaryTextStyle.copyWith(fontSize: 14),
                            ),
                            Obx(() => Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(cart.temporarySum.value),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discont',
                              style: secondaryTextStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(0),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Fee',
                              style: secondaryTextStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(checkout.delivery.value),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Insurance Fee',
                              style: secondaryTextStyle.copyWith(fontSize: 14),
                            ),
                            Obx(() => Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(checkout.insuranceMoney.value),
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView(
              children: [
                item(),
                Container(
                  color: kContainerColor,
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: double.infinity,
                ),
                insurance(),
                Container(
                  color: kContainerColor,
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: double.infinity,
                ),
                payment(),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Payment',
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 0.1,
                      ),
                      Obx(() => Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(checkout.totalPayment.value =
                                    cart.temporarySum.value +
                                        checkout.delivery.value +
                                        checkout.insuranceMoney.value),
                            style: primaryTextStyle.copyWith(
                                fontSize: 17, fontWeight: semiBold),
                          ))
                    ],
                  ),
                ),
                CustomButton(
                  title: 'Pay Now',
                  bgColor: kBlueColor,
                  textStyle: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                  onPressed: () {
                    comic.editStockComic().then((_) => comic.getComic());
                    cart.deleteCart().then((_) => cart.getCartUser());
                    checkout.addTransaction();
                  },
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
