import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/data/models/item_history_model.dart';

class HistoryModel {
  int? id;
  String? address;
  double? totalPrice;
  double? shippingPrice;
  String? status;
  String? payment;
  DateTime? createdAt;
  List<ItemHistory>? items;

  HistoryModel({
    this.id,
    this.address,
    this.totalPrice,
    this.shippingPrice,
    this.status,
    this.payment,
    this.createdAt,
    this.items,
  });

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    totalPrice = double.parse(json['total_price'].toString());
    shippingPrice = double.parse(json['shipping_price'].toString());
    status = json['status'];
    payment = json['payment'];
    createdAt = DateTime.parse(json['created_at']);
    items = json['items']
        .map<ItemHistory>((item) => ItemHistory.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'total_price': totalPrice,
      'shipping_price': shippingPrice,
      'status': status,
      'payment': payment,
      'created_at': createdAt.toString(),
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}
