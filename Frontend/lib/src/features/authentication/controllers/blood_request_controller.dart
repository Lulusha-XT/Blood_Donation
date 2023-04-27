import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodRequestControllers extends GetxController {
  static BloodRequestControllers get instance => Get.find();

  final bloodType = TextEditingController();
  final reason = TextEditingController();
  final unitRequired = TextEditingController();
  final deadLine = TextEditingController();
  final hospital = TextEditingController();
  final personInCharge = TextEditingController();
  final contactNumber = TextEditingController();
  final patientName = TextEditingController();

  RxBool hidePassword = true.obs;
  String defaultValue = 'A';
  RxBool isAsyncCallProcess = false.obs;
}
