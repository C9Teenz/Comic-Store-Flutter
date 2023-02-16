import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:komik_store/controllers/auth_controller.dart';
import 'package:komik_store/routes/routes.dart';
import '../themes/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_from_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
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
                    'Register',
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 342,
                    height: 245,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/register_logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      title: 'Name',
                      hint: 'Input your name',
                      controller: auth.nameC),
                  CustomTextFormField(
                      title: "Email",
                      hint: "Input your Email",
                      controller: auth.emailCR),
                  CustomTextFormField(
                    title: "Password",
                    hint: "Input your password",
                    controller: auth.passwordCR,
                    obscureText: true,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.12,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            CustomButton(
                              title: "Register",
                              onPressed: () {
                                auth.register();
                              },
                              textStyle: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold),
                              bgColor: kBlueColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an Account?',
                                  style: secondaryTextStyle.copyWith(
                                      fontSize: 14, fontWeight: regular),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.login);
                                  },
                                  child: Text(
                                    'Login',
                                    style: blueTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold),
                                  ),
                                ),
                              ],
                            ),
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
    ));
  }
}
