import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/features/core/pages/blood_request/widgets/carousel_slider_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = StateProvider<String>((ref) => 'Location');
final bloodTypeProvider = StateProvider<String>((ref) => 'Blood Type');

class BloodPage extends StatelessWidget {
  const BloodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CarouselSliderWidget(),
            const SizedBox(height: 16),
            _buildBloodType(context),
            const SizedBox(height: 16),
            myRequestWidget(),
            const SizedBox(height: 16),
            _buildCard('Blood Donation', 'Donate blood and save lives',
                Icons.favorite, Colors.white, () {
              // Implement blood donation logic here
            }),
            const SizedBox(height: 16),
            _buildCard('Blood Request', 'Request blood from donors',
                Icons.search, Colors.white, () {
              // Implement blood request logic here
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodType(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final location = ref.watch(locationProvider.notifier).state;
        final bloodType = ref.watch(bloodTypeProvider.notifier).state;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 60, // Set a fixed height for the container
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: location,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 3.0, // set border color here
                        ),
                      ),
                    ),
                    onChanged: (value) =>
                        ref.read(bloodTypeProvider.notifier).state = value!,
                    items: [
                      'Location',
                      'Kombolcha',
                      'Dessie',
                      'Harbu',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                    width: 20), // Add some spacing between the dropdowns
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: bloodType,
                    decoration: const InputDecoration(
                      labelText: 'Blood Type',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        ref.read(bloodTypeProvider.notifier).state = value!,
                    items: [
                      'Blood Type',
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'AB+',
                      'AB-',
                      'O+',
                      'O-',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(String title, String subtitle, IconData iconData,
      Color color, VoidCallback onPressed) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      color: color,
      elevation: 3.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: Colors.red,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myRequestWidget() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "My Request",
              style: TextStyle(
                color: cPrimaryColor,
              ),
            ),
            Icon(
              color: cPrimaryColor,
              Icons.arrow_forward_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
