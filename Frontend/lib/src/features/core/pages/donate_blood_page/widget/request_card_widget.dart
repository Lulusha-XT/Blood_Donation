import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/api/api_services.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/features/core/models/blood_request_model.dart';

class RequestCardWidget extends StatelessWidget {
  const RequestCardWidget({super.key, required this.bloodRequest});
  final List<BloodRequest> bloodRequest;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bloodRequest.length,
      itemBuilder: (context, index) {
        return RequestListWidget(bloodRequest: bloodRequest[index]);
      },
    );
  }
}

class RequestListWidget extends StatelessWidget {
  const RequestListWidget({super.key, required this.bloodRequest});
  final BloodRequest bloodRequest;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            width: 600,
            height: 180,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: cPrimaryColor)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bloodRequest.bloodType,
                              style: const TextStyle(
                                color: cPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const Text("Type"),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: cPrimaryColor,
                            thickness: 1,
                            width: 10,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              bloodRequest.hospital,
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              bloodRequest.unitRequired.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              bloodRequest.deadLine,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              bloodRequest.contactNumber,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // handle phone icon click
                              },
                              child: Icon(Icons.phone),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                // handle message icon click
                              },
                              child: Icon(Icons.message),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: 150,
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Material(
                          color:
                              cPrimaryColor, // set a different background color here
                          borderRadius: BorderRadius.circular(8.0),
                          child: InkWell(
                            onTap: () async {
                              final ApiService apiService = ApiService();
                              await apiService.donateNow(bloodRequest.userId!,
                                  bloodRequest.requestId!);
                            },
                            child: const Center(
                              child: Text(
                                'Donate Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
