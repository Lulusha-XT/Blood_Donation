import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/blood_request/blood_request.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/widget/appbar.widget.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/widget/drawer.dart';
import 'package:flutter_application_1/src/features/core/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const BloodPage(),
    const ProfilePage(),
    const Text('Nearby'),
    const Text('Donation'),
    const Text('Message'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      drawer: MyDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
