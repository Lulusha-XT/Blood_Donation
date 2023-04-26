import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/core/controllers/update_profile_controller.dart';
import 'package:get/get.dart';

class UpdateProfileWidget extends StatelessWidget {
  const UpdateProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(UpdateProfileController());
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
                prefixIcon: Icon(Icons.person_outline_rounded)),
            validator: (value) => validate(value, cFullName),
          ),
          const SizedBox(height: cFormHeigth - 20),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              label: Text(cBloodType),
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
            items: <String>['A', 'B', 'AB', 'O']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              controllers.bloodType.text = value!;
            },
            validator: (value) => validate(value, cBloodType),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
              controller: controllers.email,
              decoration: const InputDecoration(
                label: Text(cEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: validateEmail),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.phoneNo,
            decoration: const InputDecoration(
              label: Text(cPhoneNumber),
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            validator: (value) => validate(value, cPhoneNumber),
          ),
          const SizedBox(height: cFormHeigth - 20),
          Obx(
            () => TextFormField(
              controller: controllers.password,
              decoration: InputDecoration(
                label: const Text(cPassword),
                prefixIcon: const Icon(Icons.key_outlined),
                suffixIcon: IconButton(
                  onPressed: () {
                    controllers.hidePassword.value =
                        !controllers.hidePassword.value;
                  },
                  color: Colors.redAccent.withOpacity(.4),
                  icon: Icon(
                    controllers.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
              validator: (value) => validate(value, cPassword),
              obscureText: controllers.hidePassword.value,
            ),
          ),
          const SizedBox(height: cFormHeigth - 10),
        ],
      ),
    );
  }

  validate(value, String cFullName) {
    if (value!.isEmpty) {
      return "$cFullName isrequired";
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
