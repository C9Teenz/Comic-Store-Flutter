import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/controllers/cart_controller.dart';
import 'package:komik_store/routes/routes.dart';
import 'package:komik_store/widgets/custom_button_cart.dart';
import 'package:komik_store/widgets/custom_cart.dart';

import '../themes/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.find();
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'My Cart',
                style: primaryTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: Obx(
                  () => cart.cartData.isEmpty
                      ? const Center(
                          child: Text('No Comics'),
                        )
                      : ListView.builder(
                          itemCount: cart.cartData.length,
                          itemBuilder: (context, index) => CustomCart(
                            author: cart.cartData[index].comics.creator,
                            image: cart.cartData[index].comics.image,
                            price: cart.cartData[index].comics.price,
                            quantity: cart.cartData[index].quantity,
                            rating: cart.cartData[index].comics.rating,
                            title: cart.cartData[index].comics.name,
                            onPressed: () {
                              cart.addToTemporary(cart.cartData[index].id);
                            },
                          ),
                        ),
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(() => CustomButtonCart(
                          button: () {
                            Get.toNamed(Routes.checkout);
                          },
                          item: cart.temporaryData.isNotEmpty
                              ? cart.temporaryData.length
                              : 0,
                          total: cart.temporarySum.value))))
            ],
          ),
        ),
      ),
    );
  }
}
