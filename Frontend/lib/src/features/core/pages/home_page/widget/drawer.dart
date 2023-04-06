import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('JD'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Blood Request'),
            onTap: () {
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Nearby'),
            onTap: () {
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Donation'),
            onTap: () {
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Message'),
            onTap: () {
              // Add your navigation logic here
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Add your logout logic here
            },
          ),
        ],
      ),
    );
  }
}
