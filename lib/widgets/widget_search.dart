import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/controllers/comic_controller.dart';
import 'package:komik_store/themes/theme.dart';

class WidgetSearch extends StatelessWidget {
  const WidgetSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ComicController c = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        onChanged: (value) => c.filterName(value),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kContainerColor, width: 0.1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: kContainerColor, width: 0.1),
            ),
            hintText: 'Search manga'),
      ),
    );
  }
}
