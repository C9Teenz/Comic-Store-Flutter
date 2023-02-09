import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komik_store/controllers/navbar_controller.dart';
import 'package:komik_store/pages/cartpage.dart';
import 'package:komik_store/pages/homepage.dart';
import 'package:komik_store/pages/profilepage.dart';
import 'package:komik_store/pages/searchpage.dart';
import 'package:komik_store/themes/theme.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: context.tabIndex,
            children: const [
              HomePage(),
              SearchPage(),
              CartPage(),
              ProfilPage()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: kSecondaryColor,
            selectedItemColor: kBlueColor,
            onTap: context.changeTabIndex,
            currentIndex: context.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                  icon: Icons.home_outlined, label: 'Home'),
              _bottomNavigationBarItem(icon: Icons.search, label: 'Search'),
              _bottomNavigationBarItem(
                  icon: Icons.shopping_cart_outlined, label: 'cart'),
              _bottomNavigationBarItem(
                  icon: Icons.person_outline, label: 'Profile'),
            ]),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
