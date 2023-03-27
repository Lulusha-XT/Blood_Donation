import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_application_1/src/constants/image_string.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/pages/signin_page/signin_screen.dart';
import 'package:flutter_application_1/src/features/pages/signup_page/widgets/signup_form_widget.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(cDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: cWelcomeScreenImage,
                  title: cSignUpTitle,
                  subTitle: cSignUpSubTitle,
                ),
                const SizedBox(height: cDefaultSize - 10),
                const SignUpFormWidget(),
                const SizedBox(height: cDefaultSize - 10),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: cDefaultSize - 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          width: 20.0,
                          image: AssetImage(cGoogleLogoImage),
                        ),
                        label: const Text(cSignInWithGoogle),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SigninPage());
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: cAlreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const TextSpan(text: cSignin),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
