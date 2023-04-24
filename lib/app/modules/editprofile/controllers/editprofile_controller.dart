import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamo/app/data/models/user_model.dart';

class EditprofileController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController usernameC;
  late TextEditingController emailC;

  final box = GetStorage();
  late UserModel user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final data = box.read('user');
    user = UserModel.fromJson(data);

    nameC = TextEditingController(text: user.name);
    usernameC = TextEditingController(text: user.username);
    emailC = TextEditingController(text: user.email);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameC.dispose();
    emailC.dispose();
    usernameC.dispose();
  }
}
