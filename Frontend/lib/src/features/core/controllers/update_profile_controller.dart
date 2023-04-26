import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  static UpdateProfileController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final bloodType = TextEditingController();
  final dateOfBirth = TextEditingController();
  final medicalCondition = TextEditingController();
  final hidePassword = true.obs;
  RxBool isAsyncCallProcess = false.obs;

  // Future<bool> updateUser(UserModel user) async {}
}
