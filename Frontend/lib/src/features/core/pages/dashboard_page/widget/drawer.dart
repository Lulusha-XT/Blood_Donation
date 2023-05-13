import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/profile_avater/profile_avater.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_application_1/src/utils/shared_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key,
      required this.selectedIndex,
      required this.onItemTapped,
      required this.user});
  final int selectedIndex;
  final Function(int) onItemTapped;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.fullName),
            accountEmail: Text(user.email),
            decoration: BoxDecoration(
              color: cPrimaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              child: user.profilePicture == null
                  ? const CircleAvatarWithTransition(
                      image: AssetImage(cProfileImage),
                      primaryColor: Colors.white60,
                      size: 130,
                      transitionBorderwidth: 8.0,
                    )
                  : CircleAvatarWithTransition(
                      image: NetworkImage(user.fullImagePath),
                      primaryColor: Colors.white60,
                      size: 130,
                      transitionBorderwidth: 8.0,
                    ),
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
            leading: const Icon(Icons.local_hospital),
            title: const Text(cBloodRequest),
            onTap: () {
              onItemTapped(1);
            },
          ),
          ListTile(
            selected: selectedIndex == 2,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.accessibility_new),
            title: const Text(cDonateBlood),
            onTap: () {
              onItemTapped(2);
            },
          ),
          ListTile(
            selected: selectedIndex == 3,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.history),
            title: const Text(cMyRequest),
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
            leading: const Icon(Icons.location_on),
            title: const Text(cNearby),
            onTap: () {
              onItemTapped(5);
            },
          ),
          ListTile(
            selected: selectedIndex == 6,
            selectedColor: cPrimaryColor,
            leading: const Icon(Icons.message),
            title: const Text(cMessage),
            onTap: () {
              onItemTapped(6);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(cLogout),
            onTap: () async {
              await SharedService.logout(context);
            },
          ),
        ],
      ),
    );
  }
}
