import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/api/product_services.dart';
import 'package:shamo/app/data/api/transaction_services.dart';
import 'package:shamo/app/data/models/user_model.dart';
import 'package:shamo/app/shared/state.dart';

class HomeController extends GetxController {
  late UserModel user;

  final dataState = DataState.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getDataUser();
    getProducts();
    getHistories();
  }

  final RxList<dynamic> listProducts = [].obs;
  final RxList<dynamic> listHistories = [].obs;

  Future<void> getProducts() async {
    changeState(DataState.loading);
    try {
      List<dynamic> products = await ProductServices().getProducts();
      listProducts(products);
      changeState(DataState.done);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getHistories() async {
    changeState(DataState.loading);
    try {
      List<dynamic> histories = await TransactionServices().histories();
      listHistories(histories);
      print(histories);
      changeState(DataState.done);
    } catch (e) {
      print(e.toString());
    }
  }

  getDataUser() async {
    final box = GetStorage();
    final data = box.read('user');
    user = UserModel();
    user = UserModel.fromJson(data);
    print(box.read('token'));
  }

  changeState(DataState state) {
    dataState(state);
  }
}
