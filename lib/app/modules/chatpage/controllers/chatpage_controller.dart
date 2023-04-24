import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/data/models/user_model.dart';

class ChatpageController extends GetxController {
  //TODO: Implement ChatpageController

  Rx<ProductModel> product = ProductModel().obs;
  late TextEditingController chatC;

  late UserModel user;

  @override
  void onInit() {
    product(Get.arguments);
    super.onInit();
    chatC = TextEditingController(text: '');
    getDataUser();
  }

  getDataUser() async {
    final box = GetStorage();
    final data = box.read('user');
    user = UserModel();
    user = UserModel.fromJson(data);
  }
}
