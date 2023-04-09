import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key, required this.selectedIndex, required this.onItemTapped});
  final int selectedIndex;
  final Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            decoration: BoxDecoration(
              color: cPrimaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              child: Text('JD'),
            ),
          ),
          ListTile(
            selected: selectedIndex == 0,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.home_filled),
            title: const Text(cHome),
            onTap: () {
              onItemTapped(0);
            },
          ),
          ListTile(
            selected: selectedIndex == 1,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.person),
            title: const Text(cProfile),
            onTap: () {
              onItemTapped(1);
            },
          ),
          ListTile(
            selected: selectedIndex == 2,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.local_hospital),
            title: const Text(cBloodRequest),
            onTap: () {
              onItemTapped(2);
            },
          ),
          ListTile(
            selected: selectedIndex == 3,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.location_on),
            title: const Text(cNearby),
            onTap: () {
              onItemTapped(3);
            },
          ),
          ListTile(
            selected: selectedIndex == 4,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.favorite),
            title: const Text(cDonation),
            onTap: () {
              onItemTapped(4);
            },
          ),
          ListTile(
            selected: selectedIndex == 5,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.message),
            title: const Text(cMessage),
            onTap: () {
              onItemTapped(5);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(cLogout),
            onTap: () {
              // Add your logout logic here
            },
          ),
        ],
      ),
    );
  }
}
