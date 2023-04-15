import 'dart:async';

import 'package:get/get.dart';
import 'package:shamo/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.SIGN_IN));
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }
}
