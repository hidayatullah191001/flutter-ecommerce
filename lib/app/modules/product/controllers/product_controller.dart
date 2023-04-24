import 'package:get/get.dart';
import 'package:shamo/app/data/api/product_services.dart';
import 'package:shamo/app/data/models/product_model.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  List images = [
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
  ];
  int index = -1;
  int indexFamiliar = -1;
  RxInt currentIndex = 0.obs;

  List familiarShoes = [
    'assets/img_sepatu_2.png',
    'assets/img_sepatu_3.png',
    'assets/img_sepatu_4.png',
    'assets/img_sepatu_5.png',
    'assets/img_sepatu_6.png',
    'assets/img_sepatu_7.png',
    'assets/img_sepatu_8.png',
    'assets/img_sepatu_9.png',
  ];

  Rx<ProductModel> product = ProductModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    product(Get.arguments);
  }
}
