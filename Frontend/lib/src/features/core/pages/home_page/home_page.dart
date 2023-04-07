import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/widget/appbar.widget.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        drawer: MyDrawer(),
      ),
    );
  }
}
