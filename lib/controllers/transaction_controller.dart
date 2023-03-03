import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:komik_store/Models/transactionmodel.dart';
import 'package:komik_store/controllers/auth_controller.dart';

class TransactionController extends GetxController {
  AuthController auth = Get.find();
  var transactionData = <Transaction>[].obs;
  final url = 'http://10.0.2.2:8000/transactions/';

  @override
  void onInit() {
    getTransaction();
    super.onInit();
  }

  final dio = Dio();
  Future<List<Transaction>> getTransaction() async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${auth.token}";
    try {
      var response = await dio.get(url);
      List data = response.data;
      transactionData.value = data.map((e) => Transaction.fromJson(e)).toList();
      return transactionData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> editStatus(int id) async {
    try {
      var response = await dio.put('${url}edit/$id', data: {'isPayed': true});
      if (response.statusCode == 200) {
        getTransaction();
      }
    } catch (e) {
      Get.snackbar('Failed', "Make sure money is enough");
    }
  }
}
