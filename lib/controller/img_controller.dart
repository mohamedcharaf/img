// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class ImageController extends GetxController {
  Future<String?> selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      // L'image a été sélectionnée depuis la galerie ou capturée depuis la caméra
      // Retourner le chemin de l'image sélectionnée
      return pickedImage.path;
    } else {
      // Aucune image n'a été sélectionnée ou capturée
      // Gérer cet état en conséquence
      return null;
    }
  }

  Future<String?> afficheImageGallery2(ImageSource imageSource) async {
    String? imagePath;

    imagePath = await selectImage(imageSource);

    return (imagePath);
  }

  Future<String?> uploadImageToFirebaseStorage(String imagePath) async {
    File image = File(imagePath);
    String imageName = path.basename(image.path);
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(imageName);

    try {
      await ref.putFile(image);
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      // Gérer les erreurs de téléversement
      print('Error uploading image: $e');
      return null;
    }
  }
}
