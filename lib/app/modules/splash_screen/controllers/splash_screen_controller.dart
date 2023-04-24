import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    final user = box.read('user');
    Timer(
      const Duration(seconds: 3),
      () => user != null
          ? Get.offAllNamed(Routes.MAIN)
          : Get.offAllNamed(Routes.SIGN_IN),
    );
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }
}
