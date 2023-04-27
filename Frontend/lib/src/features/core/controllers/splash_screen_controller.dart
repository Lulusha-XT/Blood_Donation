import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/authentication/pages/signin_page/signin_screen.dart';
import 'package:flutter_application_1/src/features/core/pages/dashboard_page/home_page.dart';
import 'package:flutter_application_1/src/features/core/pages/on_boarding_page/on_boarding_screen.dart';
import 'package:flutter_application_1/src/utils/shared_service.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(() => const OnBoardingScreen());
  }
}
