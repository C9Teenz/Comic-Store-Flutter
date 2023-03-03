import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:komik_store/Models/cartmodel.dart';
import 'package:komik_store/controllers/auth_controller.dart';

class CartController extends GetxController {
  AuthController auth = Get.find();
  var cartData = <CartModel>[].obs;
  var temporaryData = <CartModel>[].obs;
  var temporarySum = 0.obs;
  final url = 'http://10.0.2.2:8000/carts/';

  @override
  void onInit() {
    getCartUser();

    super.onInit();
  }

  final dio = Dio();
  Future<List<CartModel>> getCartUser() async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${auth.token}";
    try {
      var response = await dio.get(url);
      List data = response.data;
      cartData.value = data.map((e) => CartModel.fromJson(e)).toList();
      return cartData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addComicToCart(int idComic) async {
    var data = {'comicId': idComic, 'quantity': 1};
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${auth.token}";
    try {
      var response = await dio.post('${url}create', data: data);
      if (response.statusCode == 200) {
        Get.snackbar('Success', "Comic has been added to cart");
        getCartUser();
      } else {
        Get.snackbar('Failed', "error 503");
      }
    } catch (e) {
      Get.snackbar('Failed', "error 503");
    }
  }

  void addToTemporary(int id) {
    var notifshow = false;
    for (var element in cartData) {
      var idExist = false;
      for (var i in temporaryData) {
        if (i.id == id) {
          idExist = true;
          if (!notifshow) {
            notifshow = true;
            Get.snackbar('failed', '${i.comics.name} is exist');
          }
          break;
        }
      }
      if (element.id == id && !idExist) {
        temporaryData.add(element);
        temporarySum += element.comics.price;

        Get.snackbar('Success', '${element.comics.name} has been added');
        break;
      }
    }
  }

  Future<void> deleteCart() async {
    try {
      if (temporaryData.isNotEmpty) {
        for (var element in temporaryData) {
          var response = await dio.get('${url}remove/${element.id}');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
