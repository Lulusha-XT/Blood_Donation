import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/text_string.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
      ),
      title: Text(cAppName, style: Theme.of(context).textTheme.headlineMedium),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: cCardBgColor),
          child: IconButton(
            onPressed: () {
              // Get.to(() => const ProfileScreen());
              // AuthenticationRepository.instance.logout();
            },
            icon: const Image(image: AssetImage(cUserProfileImage)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
