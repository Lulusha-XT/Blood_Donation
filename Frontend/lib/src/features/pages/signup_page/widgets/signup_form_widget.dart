import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/controllers/signup_controllers.dart';
import 'package:flutter_application_1/src/features/models/user_model.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SignUpControllers());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controllers.fullname,
            decoration: const InputDecoration(
              label: Text(cFullName),
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.email,
            decoration: const InputDecoration(
              label: Text(cEmail),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.phoneNo,
            decoration: const InputDecoration(
              label: Text(cPhoneNumber),
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.password,
            decoration: const InputDecoration(
              label: Text(cPassword),
              prefixIcon: Icon(Icons.key_outlined),
            ),
          ),
          const SizedBox(height: cFormHeigth - 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final user = UserModel(
                    email: controllers.email.text.trim(),
                    password: controllers.password.text.trim(),
                    fullName: controllers.fullname.text.trim(),
                    phoneNo: controllers.phoneNo.text.trim(),
                  );
                  SignUpControllers.instance
                      .registerUser(user.email, user.password);
                  SignUpControllers.instance.createUser(user);
                  //   Get.to(() => const OTPScrenn());
                }
              },
              child: Text(cSignup.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
