import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/product_model.dart';

class WishlistController extends GetxController {
  RxList<ProductModel> wishList = <ProductModel>[].obs;
  final box = GetStorage();

  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      wishList.add(product);
    } else {
      wishList.removeWhere((element) => element.id == product.id);
    }
  }

  isWishlist(ProductModel product) {
    if (wishList.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
