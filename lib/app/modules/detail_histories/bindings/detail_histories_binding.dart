import 'package:get/get.dart';

import '../controllers/detail_histories_controller.dart';

class DetailHistoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHistoriesController>(
      () => DetailHistoriesController(),
    );
  }
}
