import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/api/auth_services.dart';
import 'package:shamo/app/data/models/user_model.dart';
import 'package:shamo/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  late UserModel user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataUser();
  }

  logout() async {
    final data = await AuthServices().logout();
    if (data) {
      Get.snackbar('Success', 'Berhasil keluar dari aplikasi!');
      Get.offAndToNamed(Routes.SIGN_IN);
    } else {
      Get.snackbar('Failed', 'Failed Logout');
    }
  }

  getDataUser() {
    final box = GetStorage();
    final data = box.read('user');
    user = UserModel();
    user = UserModel.fromJson(data);
  }
}
