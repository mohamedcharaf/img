// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/img_controller.dart';

class Pharmacy {
  final String name;
  final double distance;
  final double latitude;
  final double longitude;
  bool isSelected;

  Pharmacy({
    required this.name,
    required this.distance,
    required this.latitude,
    required this.longitude,
    this.isSelected = false,
  });
}



class PharmacyListScreen extends StatefulWidget {


  const PharmacyListScreen({super.key, });
  @override
  _PharmacyListScreenState createState() => _PharmacyListScreenState();
}

class _PharmacyListScreenState extends State<PharmacyListScreen> {
    static ImageController controller = Get.put(ImageController());
  List<Pharmacy> pharmacies = [
    Pharmacy(name: 'Pharmacy A', distance: 2.5, latitude: 40.7128, longitude: -74.0060),
    Pharmacy(name: 'Pharmacy B', distance: 4.0, latitude: 34.0522, longitude: -118.2437),
    Pharmacy(name: 'Pharmacy C', distance: 1.2, latitude: 51.5074, longitude: -0.1278),
  ];
  bool isAllSelected = false;

@override
Widget build(BuildContext context) {
  bool anyItemSelected = pharmacies.any((pharmacy) => pharmacy.isSelected);

  return Scaffold(
    appBar: AppBar(
      title: const Text('Pharmacy List'),
    ),
    body: ListView.builder(
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(pharmacies[index].name),
          subtitle: Text('${pharmacies[index].distance} km away'),
          leading: IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              _launchMap(pharmacies[index]);
            },
          ),
          trailing: Checkbox(
            value: pharmacies[index].isSelected,
            onChanged: (bool? value) {
              setState(() {
                pharmacies[index].isSelected = value!;
                _checkAllSelected();
              });
            },
          ),
        );
      },
    ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                isAllSelected = !isAllSelected;
                pharmacies.forEach((pharmacy) {
                  pharmacy.isSelected = isAllSelected;
                });
              });
            },
            label: Text(isAllSelected ? 'Deselect All' : 'Select All'),
            icon: const Icon(Icons.select_all),
          ),
        ),
        const SizedBox(width: 10), // Add some space between buttons
        anyItemSelected
            ? FloatingActionButton( // Show only if any item is selected
                onPressed: () {
                  // Your action when this button is pressed
                 showDialog(
                  context :context,
                   builder: (context) {
                     return AlertDialog(
              title: const Text('Image envoyée'),
              content: const Text('Votre image a été envoyée avec succès.'),
              actions: [
                TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();

                      
                      },
                      child: const Text('OK'),
                ),
              ],
            );
                   }, 
                 );

                  
                },
                child: const Icon(Icons.send),
              )
            : const SizedBox(), // Empty SizedBox if no item is selected
      ],
    ),
  );
}


  void _launchMap(Pharmacy pharmacy) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=${pharmacy.latitude},${pharmacy.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _checkAllSelected() {
    setState(() {
      isAllSelected = pharmacies.every((pharmacy) => pharmacy.isSelected);
    });
  }
  void _handleSendImage(BuildContext context, String selectedImagePath) {
    controller.uploadImageToFirebaseStorage(selectedImagePath);
    controller.uploadImageAndAddToFirestore(selectedImagePath);

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 30,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    Timer(
      const Duration(seconds: 5),
      () {
        overlayEntry?.remove();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Image envoyée'),
              content: const Text('Votre image a été envoyée avec succès.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
