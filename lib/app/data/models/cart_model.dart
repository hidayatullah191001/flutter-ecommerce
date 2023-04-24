import 'package:get/get.dart';
import 'package:shamo/app/data/models/product_model.dart';

class CartModel {
  int? id;
  ProductModel? product;
  RxInt quantity = 1.obs;

  CartModel({this.id, this.product, required this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return (double.parse(product?.price as String) * quantity.value);
  }
}
