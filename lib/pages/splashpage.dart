import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/themes/theme.dart';

import '../controllers/auth_controller.dart';

class SplashPage extends StatelessWidget {
  final c = Get.put(AuthController());
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Vector.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 337,
                      height: 241,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/splash_logo.png'))),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Bookery",
                      style: splashTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 32),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Your Book Shopping Place',
                      style: secondaryTextStyle.copyWith(
                          fontWeight: regular, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
