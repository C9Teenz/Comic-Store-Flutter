import 'package:flutter/material.dart';
import 'package:komik_store/controllers/auth_controller.dart';
import 'package:komik_store/routes/routes.dart';

import 'package:komik_store/themes/theme.dart';
import 'package:komik_store/widgets/custom_button.dart';
import 'package:komik_store/widgets/custom_text_from_field.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authC = Get.find();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).padding.bottom),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.5,
                  maxHeight: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top +
                          MediaQuery.of(context).padding.bottom),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Login',
                      style: primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 347,
                      height: 248,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/login_logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                        title: "Email",
                        hint: "Input your Email",
                        controller: authC.emailC),
                    CustomTextFormField(
                      title: "Password",
                      hint: "Input your password",
                      controller: authC.passwordC,
                      obscureText: true,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Column(
                            children: [
                              CustomButton(
                                  title: "Login",
                                  bgColor: kBlueColor,
                                  textStyle: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: semiBold),
                                  onPressed: () {
                                    authC.login();
                                  }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have account?',
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 14, fontWeight: regular),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.register);
                                      },
                                      child: Text(
                                        'Register',
                                        style: blueTextStyle.copyWith(
                                            fontSize: 14, fontWeight: semiBold),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
