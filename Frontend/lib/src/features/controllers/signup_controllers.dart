import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/models/user_model.dart';
import 'package:get/get.dart';

class SignUpControllers extends GetxController {
  static SignUpControllers get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  //final userRepo = Get.put(UserRepository());
  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) {
    // AuthenticationRepository.instance .createUserWithEmailAndPassword(email, password);
  }

  void createUser(UserModel user) async {
    // await userRepo.createUser(user);
  }
}
