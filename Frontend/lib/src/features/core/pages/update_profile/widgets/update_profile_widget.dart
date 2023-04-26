import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/circularProgressBar/circular_progress_widget.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/core/controllers/update_profile_controller.dart';
import 'package:get/get.dart';

import '../../../../../config/config.dart';
import '../../../../../constants/colors.dart';
import '../../../../authentication/models/user_model.dart';
import '../../dashboard_page/home_page.dart';

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
          Obx(
            () => controllers.isAsyncCallProcess.value
                ? const Center(
                    child: DottedCircularProgressIndicatorFb(
                      currentDotColor: cSecondaryColor,
                      defaultDotColor: cPrimaryColor,
                      numDots: 8,
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // Show circular progress indicator while creating user
                          controllers.isAsyncCallProcess.value = true;
                          final user = UserModel(
                            email: controllers.email.text.trim(),
                            password: controllers.password.text.trim(),
                            fullName: controllers.fullname.text.trim(),
                            phoneNo: controllers.phoneNo.text.trim(),
                            bloodType: controllers.bloodType.text.trim(),
                          );

                          // SignUpControllers.instance
                          //     .registerUser(user.email, user.password);
                          try {
                            await UpdateProfileController.instance
                                    .updateUser(user)
                                ?

                                // If the registration was successful

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(Config.appName),
                                        content: const Text(
                                            "Update completed successfully"),
                                        actions: [
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              // Navigator.of(context).pop();
                                              // Navigator.of(context)
                                              //     .pushNamedAndRemoveUntil(
                                              //   "/login",
                                              //   (route) => false,
                                              // );
                                              Get.to(() => const HomePage());
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )

                                // If the email is already registered
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(Config.appName),
                                        content: const Text(
                                            "This email is already registered"),
                                        actions: [
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                          } catch (e) {
                            // If there was an error during the registration process
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(Config.appName),
                                  content: Text(
                                      "An error occurred: ${e.toString()}"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          //   Get.to(() => const OTPScrenn());
                        }
                      },
                      child: Text("Update"),
                    ),
                  ),
          ),
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
