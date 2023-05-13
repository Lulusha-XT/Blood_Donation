import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/core/pages/blood_request/blood_requiest_page.dart';
import 'package:flutter_application_1/src/features/core/pages/chat_screen/chat_screen.dart';
import 'package:flutter_application_1/src/features/core/pages/home_page/blood_request.dart';
import 'package:flutter_application_1/src/features/core/pages/dashboard_page/widget/appbar.widget.dart';
import 'package:flutter_application_1/src/features/core/pages/dashboard_page/widget/drawer.dart';
import 'package:flutter_application_1/src/features/core/pages/donate_blood_page/donate_blood_page.dart';
import 'package:flutter_application_1/src/features/core/pages/my_request_page/my_request_page.dart';
import 'package:flutter_application_1/src/features/core/pages/nearby_page/nearby_page.dart';
import 'package:flutter_application_1/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const BloodPage(),
    const BloodRequestPage(),
    const DonateBloodPage(),
    const MyRequestPage(),
    const Text('Donation'),
    const NearbyPage(),
    ChatScreen(),
  ];
  void launchUrl() async {
    const url =
        "https://www.google.co.uk/maps/place/Student's+Clinic/@11.0495425,39.7474534,417m/data=!3m1!1e3!4m6!3m5!1s0x16479dc587f46b15:0x77cf17af4bfa91a0!8m2!3d11.0499626!4d39.7477662!16s%2Fg%2F11dxhzqrzf";
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 5) {
        launchUrl();
      }
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    if (user.id == null) {
      ref.watch(userProvider.notifier).getUser();
      return const Scaffold(
        body: Center(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: DashboardAppBar(user: user),
      drawer: MyDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        user: user,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
