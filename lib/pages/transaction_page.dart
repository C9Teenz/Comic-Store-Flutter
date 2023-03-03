import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:komik_store/controllers/transaction_controller.dart';

import 'package:komik_store/themes/theme.dart';

import '../controllers/cart_controller.dart';
import '../controllers/comic_controller.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionController transaction = Get.find();
    CartController cart = Get.find();
    ComicController comic = Get.find();
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: kWhiteColor,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(
                      width: 24,
                    ),
                    Text(
                      'My Transaction',
                      style: primaryTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 33,
                      margin: const EdgeInsets.only(right: 16),
                      width: 168,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kSecondaryColor.withOpacity(0.7),
                      ),
                      child: Center(
                          child: Text(
                        'Payed',
                        style: primaryTextStyle.copyWith(fontSize: 14),
                      )),
                    ),
                    Container(
                      height: 33,
                      width: 168,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kSecondaryColor.withOpacity(0.7),
                      ),
                      child: Center(
                          child: Text(
                        'Waiting for Pay',
                        style: primaryTextStyle.copyWith(fontSize: 14),
                      )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Obx(
                    () => transaction.transactionData.isEmpty
                        ? const Center(
                            child: Text('No Item'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: transaction.transactionData.length,
                            itemBuilder: (context, index) => Container(
                              height: 150, // tinggi container
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.shopping_bag,
                                        size: 50,
                                      ), // ganti dengan lokasi dan nama file logo barang
                                      const SizedBox(
                                          width:
                                              16), // spasi antara gambar dan kolom teks
                                      Text(
                                          "Item ${transaction.transactionData[index].id}",
                                          style: primaryTextStyle.copyWith(
                                              fontSize: 24,
                                              fontWeight: semiBold)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Total Pembayaran",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'IDR ',
                                                    decimalDigits: 0)
                                                .format(transaction
                                                    .transactionData[index]
                                                    .total),
                                            style: primaryTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: semiBold),
                                          ), // total pembayaran
                                        ],
                                      ),
                                      // spasi antara kolom teks dan tombol
                                      transaction.transactionData[index]
                                                  .isPayed ==
                                              false
                                          ? ElevatedButton(
                                              onPressed: () {
                                                transaction.editStatus(
                                                    transaction
                                                        .transactionData[index]
                                                        .id);
                                                comic.editStockComic().then(
                                                    (_) => comic.getComic());
                                                cart.deleteCart().then((_) {
                                                  cart.getCartUser();
                                                  cart.temporaryData.value = [];
                                                  cart.temporarySum.value = 0;
                                                });
                                              },
                                              child:
                                                  const Text("Bayar Sekarang"),
                                            )
                                          : const ElevatedButton(
                                              onPressed: null,
                                              child: Text("Bayar Sekarang"),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
