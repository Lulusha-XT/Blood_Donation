import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:get/get.dart';

import '../../authentication/models/user_model.dart';

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

  Future<bool> updateUser(UserModel user) async {
    bool result = await ApiService.updtaProfile(user);
    isAsyncCallProcess.value = false;
    return result;
  }
}
