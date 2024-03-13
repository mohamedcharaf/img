// ignore_for_file: avoid_print

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class ImageUploader {
  final picker = ImagePicker();

  Future<String?> uploadImageToFirebase() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      String imageName = path.basename(image.path);
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(imageName);

      try {
        await ref.putFile(image);
        String downloadURL = await ref.getDownloadURL();
        return downloadURL;
      } catch (e) {
        print('Error uploading image to Firebase Storage: $e');
        return null;
      }
    } else {
      print('No image selected.');
      return null;
    }
  }
}
