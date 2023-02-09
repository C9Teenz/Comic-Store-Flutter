import 'package:flutter/material.dart';
import 'package:komik_store/themes/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: kSecondaryColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: kSecondaryColor),
                ),
                hintText: hint),
          ),
        ],
      ),
    );
  }
}
