// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../controller/test_controller.dart'; // Assuming this is the correct path for your controller


class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Assuming `ImageUploader.uploadImageToFirebase();` is a static method
               ImageUploader imageUploader = ImageUploader();
            await imageUploader.uploadImageToFirebase();
          },
          child: const Text("gallery"),
        ),
      ),
    );
  }
}
