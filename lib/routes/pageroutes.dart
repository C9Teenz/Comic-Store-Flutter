import 'package:get/get.dart';

import 'package:komik_store/bindings/navbar_binding.dart';
import 'package:komik_store/bindings/transaction_binding.dart';
import 'package:komik_store/pages/checkoutpage.dart';
import 'package:komik_store/pages/detailpage.dart';
import 'package:komik_store/pages/loginpage.dart';
import 'package:komik_store/pages/navbar.dart';
import 'package:komik_store/pages/registerpage.dart';
import 'package:komik_store/pages/splashpage.dart';
import 'package:komik_store/pages/transaction_page.dart';
import 'package:komik_store/routes/routes.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
    ),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.register, page: () => const RegisterPage()),
    GetPage(
        name: Routes.navbar,
        page: () => const Navbar(),
        binding: NavbarBinding()),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutPage(),
    ),
    GetPage(
        name: Routes.transaction,
        page: () => const TransactionPage(),
        binding: TransactionBindings())
  ];
}
