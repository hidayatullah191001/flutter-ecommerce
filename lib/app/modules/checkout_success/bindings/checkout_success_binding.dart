import 'package:get/get.dart';

import '../controllers/checkout_success_controller.dart';

class CheckoutSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutSuccessController>(
      () => CheckoutSuccessController(),
    );
  }
}
