import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/product_model.dart';

class CartController extends GetxController {
  RxList<CartModel> carts = <CartModel>[].obs;

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          carts.indexWhere((element) => element.product?.id == product.id);
      carts[index].quantity.value++;
    } else {
      carts.add(
        CartModel(
          id: carts.length,
          product: product,
          quantity: RxInt(1),
        ),
      );
    }
  }

  removeCart(int id) {
    carts.removeAt(id);
  }

  addQuantity(int id) {
    carts[id].quantity.value++;
  }

  reduceQuantity(int id) {
    carts[id].quantity.value--;

    if (carts[id].quantity.value == 0) {
      removeCart(id);
    }
  }

  totalItems() {
    int total = 0;
    for (var element in carts) {
      total += element.quantity.value;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var element in carts) {
      total += (element.quantity.value * element.product!.price!);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (carts.indexWhere((element) => element.product?.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
