import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  void launchUrl() async {
    const url =
        "https://www.google.co.uk/maps/place/Student's+Clinic/@11.0495425,39.7474534,417m/data=!3m1!1e3!4m6!3m5!1s0x16479dc587f46b15:0x77cf17af4bfa91a0!8m2!3d11.0499626!4d39.7477662!16s%2Fg%2F11dxhzqrzf";
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                launchUrl();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(
                          0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text("Nearby "),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
