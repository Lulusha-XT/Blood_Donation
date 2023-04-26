import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/form/form_header_widget.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/features/core/pages/blood_request/widgets/blood_request_form_widget.dart';
import 'package:get/get.dart';

class BloodRequestPage extends StatelessWidget {
  const BloodRequestPage({super.key});

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
                const SizedBox(height: cDefaultSize - 10),
                const BloodRequiestFormWidget(),
                const SizedBox(height: cDefaultSize - 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
