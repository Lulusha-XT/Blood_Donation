import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInControllers extends GetxController {
  static SignInControllers get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void signInUser(String email, String password) {
    // AuthenticationRepository.instance.signInUserWithEmailAndPassword(email, password);
  }
}
