import 'package:get/get.dart';

import '../controllers/chatpage_controller.dart';

class ChatpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatpageController>(
      () => ChatpageController(),
    );
  }
}
