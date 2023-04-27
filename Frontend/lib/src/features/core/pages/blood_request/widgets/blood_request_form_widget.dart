import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/circularProgressBar/circular_progress_widget.dart';
import 'package:flutter_application_1/src/config/config.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/authentication/controllers/blood_request_controller.dart';
import 'package:flutter_application_1/src/features/core/models/blood_request_model.dart';
import 'package:flutter_application_1/src/features/core/pages/dashboard_page/home_page.dart';
import 'package:flutter_application_1/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class BloodRequiestFormWidget extends ConsumerWidget {
  const BloodRequiestFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = Get.put(BloodRequestControllers());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            value: controllers.defaultValue, // set the default value here
            decoration: const InputDecoration(
              label: Text(cBloodType),
              prefixIcon: Icon(Icons.bloodtype),
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
            controller: controllers.reason,
            decoration: const InputDecoration(
              label: Text(cReason),
              prefixIcon: Icon(Icons.abc_outlined),
            ),
            validator: (value) => validate(value, cReason),
          ),
          const SizedBox(height: cFormHeigth - 20),
          // set the default value to 'A'

// build the DropdownButtonFormField widget
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.unitRequired,
            decoration: const InputDecoration(
              label: Text(cUnitRequired),
              prefixIcon: Icon(Icons.ac_unit),
            ),
            validator: (value) => validate(value, cUnitRequired),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.deadLine,
            decoration: const InputDecoration(
              label: Text(cDeadLine),
              prefixIcon: Icon(Icons.dangerous),
            ),
            validator: (value) => validate(value, cDeadLine),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.hospital,
            decoration: const InputDecoration(
              label: Text(cHospital),
              prefixIcon: Icon(Icons.local_hospital_outlined),
            ),
            validator: (value) => validate(value, cHospital),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.personInCharge,
            decoration: const InputDecoration(
              label: Text(cPersonInCharge),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) => validate(value, cPersonInCharge),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.contactNumber,
            decoration: const InputDecoration(
              label: Text(cContactNumber),
              prefixIcon: Icon(Icons.contact_emergency),
            ),
            validator: (value) => validate(value, cContactNumber),
          ),
          const SizedBox(height: cFormHeigth - 20),
          TextFormField(
            controller: controllers.patientName,
            decoration: const InputDecoration(
              label: Text(cPatientName),
              prefixIcon: Icon(Icons.local_hospital),
            ),
            validator: (value) => validate(value, cPatientName),
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
                          final bloodRequest = BloodRequest(
                            bloodType: controllers.bloodType.text.trim(),
                            reason: controllers.reason.text.trim(),
                            unitRequired: double.parse(
                                controllers.unitRequired.text.trim()),
                            deadLine: controllers.deadLine.text.trim(),
                            hospital: controllers.hospital.text.trim(),
                            personInCharge:
                                controllers.personInCharge.text.trim(),
                            contactNumber:
                                controllers.contactNumber.text.trim(),
                            patientName: controllers.patientName.text.trim(),
                          );

                          // SignUpControllers.instance
                          //     .registerUser(user.email, user.password);
                          try {
                            await ref
                                    .watch(bloodRequestProvider.notifier)
                                    .createBloodRequest(bloodRequest)
                                ?

                                // If the registration was successful

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(Config.appName),
                                        content: const Text(
                                            "Blood requiest completed successfully"),
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
                                        actions: <Widget>[
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
                                  actions: <Widget>[
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
                      child: Text(cRequest.toUpperCase()),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  String? validate(String? value, String inputName) {
    if (value!.isEmpty) {
      return "$inputName is required";
    }
    return null;
  }
}
