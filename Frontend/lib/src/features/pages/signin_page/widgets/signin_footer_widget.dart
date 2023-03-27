import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/pages/signup_page/signup_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/constants/image_string.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: cFormHeigth - 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              width: 20.0,
              image: AssetImage(cGoogleLogoImage),
            ),
            onPressed: () {},
            label: const Text(cSignInWithGoogle),
          ),
        ),
        const SizedBox(height: cFormHeigth - 10),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpPage());
          },
          child: Text.rich(
            TextSpan(
              text: cDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: const [
                TextSpan(
                  text: cSignup,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
