import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
<<<<<<<< HEAD:Frontend/lib/src/features/authentication/pages/on_boarding_page/on_boarding_widget.dart
import 'package:flutter_application_1/src/features/authentication/models/model_on_boarding.dart';
========
import 'package:flutter_application_1/src/features/core/models/model_on_boarding.dart';
>>>>>>>> leul:Frontend/lib/src/features/core/pages/on_boarding_page/on_boarding_widget.dart

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(cDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.4),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: cPrimaryColor, fontWeight: FontWeight.bold),
              ),
              Text(model.subTitle),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: cPrimaryColor),
          ),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}
