import 'package:get/get.dart';
import 'package:komik_store/controllers/transaction_controller.dart';

class TransactionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
