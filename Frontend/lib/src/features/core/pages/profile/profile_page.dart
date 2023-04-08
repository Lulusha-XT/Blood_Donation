import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common_widgets/profile_avater/profile_avater.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/features/authentication/models/user_model.dart';
import 'package:flutter_application_1/src/features/core/pages/profile/widget/profil_card_widget.dart';
import 'package:flutter_application_1/src/features/core/pages/profile/widget/profile_button_widget.dart';
import 'package:flutter_application_1/src/features/core/pages/profile/widget/profile_sizedbox_widget.dart';
import 'package:flutter_application_1/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.red,
      child: _userData(ref, context),
    );
  }

  Widget _userData(WidgetRef ref, BuildContext context) {
    final products = ref.watch(userProvider);

    return products.when(
        data: (user) {
          return _profileMainComps(user!, context);
        },
        error: (_, __) {
          return const Center(child: Text("ERROR"));
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _profileMainComps(UserModel user, BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(cDefaultSize),
              decoration: const BoxDecoration(
                color: cPrimaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatarWithTransition(
                            image: AssetImage(cProfileImage),
                            primaryColor: Colors.white60,
                            size: 130,
                            transitionBorderwidth: 8.0,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: const [
                              Text(
                                "Leul sileshi",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text("", style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: cPrimaryColor,
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ProfileSizedBoxs(
                        content: 'Requests',
                      ),
                      ProfileSizedBoxs(
                        content: 'Donations',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(cDefaultSize),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Birth Date',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '07/04/2023',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Blood Type',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'AB+',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ProfileCardsWidget(
                        cardHeader: user.fullName,
                        icon: const Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ProfileCardsWidget(
                        cardHeader: 'Medical Condition',
                        icon: Icon(
                          Icons.medical_information_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ProfileCardsWidget(
                        cardHeader: 'Contact',
                        icon: Icon(
                          Icons.phone,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ProfileCardsWidget(
                        cardHeader: 'Email',
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ProfileButton(
                        buttonText: "Who can i donate",
                      ),
                      const SizedBox(height: 10),
                      const ProfileButton(
                        buttonText: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
