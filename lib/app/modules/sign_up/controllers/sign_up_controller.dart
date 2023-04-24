import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/api/auth_services.dart';
import 'package:shamo/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController usernameC;
  late TextEditingController emailC;
  late TextEditingController passwordC;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameC = TextEditingController(text: '');
    usernameC = TextEditingController(text: '');
    emailC = TextEditingController(text: '');
    passwordC = TextEditingController(text: '');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameC.dispose();
    usernameC.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  void register() async {
    isLoading(true);
    final result = await AuthServices().register(
      name: nameC.text,
      username: usernameC.text,
      email: emailC.text,
      password: passwordC.text,
    );

    if (result) {
      Get.toNamed(Routes.MAIN);
    } else {
      Get.snackbar('Gagal', 'Gagal Register');
    }
    isLoading(false);
  }
}
