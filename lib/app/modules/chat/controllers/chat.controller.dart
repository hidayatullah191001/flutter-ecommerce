import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/user_model.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController

  late UserModel user;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataUser();
  }

  getDataUser() async {
    final box = GetStorage();
    final data = box.read('user');
    user = UserModel();
    user = UserModel.fromJson(data);
  }
}
