import 'package:get/get.dart';

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
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
    'assets/img_sepatu_1.png',
  ];
}
