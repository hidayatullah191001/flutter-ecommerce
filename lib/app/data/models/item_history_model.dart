class ItemHistory {
  int? id;
  int? usersId;
  int? productsId;
  int? transactionsId;
  int? quantity;
  String? createdAt;
  Product? product;

  ItemHistory(
      {this.id,
      this.usersId,
      this.productsId,
      this.transactionsId,
      this.quantity,
      this.createdAt,
      this.product});

  ItemHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    productsId = json['products_id'];
    transactionsId = json['transactions_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['users_id'] = usersId;
    data['products_id'] = productsId;
    data['transactions_id'] = transactionsId;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  int? price;
  String? description;
  int? categoriesId;

  Product(
      {this.id, this.name, this.price, this.description, this.categoriesId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    categoriesId = json['categories_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['categories_id'] = categoriesId;
    return data;
  }
}
