import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shamo/app/shared/values.dart';

class ProductServices {
  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: headerContent,
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['data'];
        List<ProductModel> products = [];

        for (var item in data) {
          products.add(ProductModel.fromJson(item));
        }
        return products;
      } else {
        throw Exception('Gagal get products');
      }
    } catch (e) {
      rethrow;
    }
  }

  saveDataToStorage(String key, dynamic value) {
    final box = GetStorage();
    final save = box.write(key, value);
  }

  getDataFromStorage(String key) {
    final box = GetStorage();
    return box.read(key);
  }
}
