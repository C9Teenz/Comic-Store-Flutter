import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:komik_store/controllers/auth_controller.dart';

import '../themes/theme.dart';

class WidgetProfil extends StatelessWidget {
  const WidgetProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    AuthController user = Get.find();
    return SizedBox(
      height: height * 0.38,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.25,
            decoration: BoxDecoration(
                color: kBlueColor,
                image: const DecorationImage(
                    image: AssetImage('assets/Vector 2.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: height * 0.38,
            width: double.infinity,
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Container(
                      height: 135,
                      width: 135,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: AssetImage('assets/profil.png'))),
                    ),
                    Text(
                      user.userData.value.name,
                      style: primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      user.userData.value.email,
                      style: secondaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 8,
                        width: double.infinity,
                        color: kContainerColor,
                      ),
                    ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
