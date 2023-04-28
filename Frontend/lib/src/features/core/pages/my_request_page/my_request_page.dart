import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/my_request_page/widget/request_card_widget.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestCardWidget(),
    );
  }
}
