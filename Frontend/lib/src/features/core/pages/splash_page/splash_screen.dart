import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
<<<<<<<< HEAD:Frontend/lib/src/features/authentication/pages/splash_page/splash_screen.dart
import 'package:flutter_application_1/src/features/authentication/controllers/splash_screen_controller.dart';
========
import 'package:flutter_application_1/src/features/core/controllers/splash_screen_controller.dart';
>>>>>>>> leul:Frontend/lib/src/features/core/pages/splash_page/splash_screen.dart
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Image(
                  image: AssetImage(cSplashTopIcon),
                  width: cDefaultWidth,
                ),
              ),
            ),
            Obx(
              () => Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.grey[300]!,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Text(
                    cSplashText,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: cPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
