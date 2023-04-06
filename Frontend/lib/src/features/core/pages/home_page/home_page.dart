import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/widget/appbar.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DashboardAppBar(),
    );
  }
}
