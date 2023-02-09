import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:komik_store/routes/routes.dart';

import 'package:komik_store/widgets/custom_logout_button.dart';
import 'package:komik_store/widgets/widget_profil.dart';
import 'package:komik_store/widgets/widgets_settings.dart';

import '../controllers/auth_controller.dart';
import '../themes/theme.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();

    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          children: [
            const WidgetProfil(),
            const WidgetSettings(),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomLogoutbutton(
                onPressed: () {
                  // auth.getUser();
                  Get.defaultDialog(
                    title: 'Alert',
                    middleText: 'Are You Sure?',
                    textCancel: 'Cencel',
                    textConfirm: 'Yes',
                    onConfirm: () {
                      auth.deleteToken();
                      Get.offAllNamed(Routes.login);
                    },
                  );
                },
                title: 'Logout',
              ),
            ))
          ],
        ));
  }
}
