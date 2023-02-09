import 'package:flutter/material.dart';

import '../themes/theme.dart';

class WidgetSettings extends StatelessWidget {
  const WidgetSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.2,
      color: kWhiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Settings',
            style:
                primaryTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: height * 0.11,
            color: kWhiteColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.05,
                  color: kWhiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Username',
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Color(0xff94A3B8),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  width: double.infinity,
                  color: kContainerColor,
                ),
                Container(
                  width: double.infinity,
                  height: height * 0.05,
                  color: kWhiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Password',
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Color(0xff94A3B8),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  width: double.infinity,
                  color: kContainerColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
