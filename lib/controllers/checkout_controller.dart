import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/controllers/cart_controller.dart';
import 'package:komik_store/routes/routes.dart';

import '../themes/theme.dart';
import '../widgets/custom_button.dart';
import 'auth_controller.dart';

class CheckoutController extends GetxController {
  AuthController auth = Get.find();
  CartController cart = Get.find();
  var insurance = false.obs;
  var insuranceMoney = 0.obs;
  var totalPayment = 0.obs;
  var delivery = 50000.obs;
  final url = 'http://10.0.2.2:8000/transactions/';
  // @override
  // void onInit() {

  //   super.onInit();
  // }
  var dio = Dio();
  Future<void> addTransaction() async {
    var data = {'total': totalPayment.value};
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${auth.token}";
    try {
      var response = await dio.post('${url}create', data: data);
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "Payment!",
            titleStyle: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            backgroundColor: kBlueColor,
            content: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/success.png'))),
                ),
                Text(
                  'Payment Success!',
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Your item has been paid successfully',
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  title: 'Back To Home',
                  onPressed: () {
                    back();
                  },
                  bgColor: kWhiteColor,
                  textStyle: blueTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )
              ],
            ));
      } else {
        print('Payement failed');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void checkbox() {
    insurance.value = !insurance.value;
    if (insurance.value == false) {
      insuranceMoney.value = 0;
    } else {
      insuranceMoney.value = 100000;
    }
  }

  void back() {
    cart.temporaryData.value = [];
    Get.offNamed(Routes.navbar);
  }
}
