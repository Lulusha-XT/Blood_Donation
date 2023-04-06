import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/authentication/controllers/signin_controllers.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SignInControllers());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: cFormHeigth - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controllers.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: cEmail,
                hintText: cEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: cFormHeigth),
            TextFormField(
              controller: controllers.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.key_outlined),
                labelText: cPassword,
                hintText: cPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: cFormHeigth),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(cForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SignInControllers.instance.signInUser(
                        controllers.email.text.trim(),
                        controllers.password.text.trim());
                  }
                },
                child: const Text(cSignin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
