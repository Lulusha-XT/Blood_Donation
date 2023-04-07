import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(cDefaultSize),
              decoration: const BoxDecoration(
                color: cPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image: AssetImage(cProfileImage))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: cPrimaryColor,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  //  pick imaGe
                                  // install image_picker
                                  // import the corresponding library
                                  ImagePicker imagePicker = ImagePicker();
                                  XFile? file = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  print("${file?.path}");
                                  if (file == null) return;

                                  String uniqueFileName = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "Leul sileshi",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("A+", style: TextStyle(color: Colors.white))
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
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            )
          ]),
        ),
      )),
    );
  }
}