import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';

class RequestCardWidget extends StatelessWidget {
  const RequestCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: cPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 100,
          ),
        ],
      ),
    );
  }
}
