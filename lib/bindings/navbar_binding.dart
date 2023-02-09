import 'package:get/get.dart';

import 'package:komik_store/controllers/genre_controller.dart';
import 'package:komik_store/controllers/navbar_controller.dart';

import '../controllers/cart_controller.dart';
import '../controllers/comic_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<ComicController>(() => ComicController());
    Get.lazyPut<GenreController>(() => GenreController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
