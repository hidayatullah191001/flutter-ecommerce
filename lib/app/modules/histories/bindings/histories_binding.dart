import 'package:get/get.dart';

import '../controllers/histories_controller.dart';

class HistoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriesController>(
      () => HistoriesController(),
    );
  }
}
