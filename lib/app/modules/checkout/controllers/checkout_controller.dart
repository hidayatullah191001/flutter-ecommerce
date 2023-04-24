import 'package:get/get.dart';
import 'package:shamo/app/data/api/transaction_services.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/routes/app_pages.dart';
import 'package:shamo/app/shared/state.dart';

class CheckoutController extends GetxController {
  final dataState = DataState.loading.obs;

  postCheckout(List<CartModel> carts, double totalPrice) async {
    final checkout = await TransactionServices().checkout(carts, totalPrice);
    print(checkout);
    if (checkout == true) {
      Get.snackbar('Success', 'Pesanan berhasil dibuat');
      Get.offAndToNamed(Routes.CHECKOUT_SUCCESS);
    } else {
      Get.snackbar('Failed', 'Something went wrong!');
    }
  }

  changeState(DataState state) {
    dataState(state);
  }
}
