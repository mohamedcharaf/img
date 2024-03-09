// ignore_for_file: prefer_const_constructors, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserController {
  BuildContext context; // Ajout de la référence au contexte

  UserController(this.context);

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
  
  Future<Widget> afficheImageGallery() async {
    String? imagePath;

imagePath = await selectImage(ImageSource.gallery);

   
    if (imagePath != null) {
      return Image.file(File(imagePath));
    } else {
      return Text('Aucune image sélectionnée');
    }
  }

    Future<Widget> afficheImageCamera() async {
    String? imagePath;

imagePath = await selectImage(ImageSource.camera);

   
    if (imagePath != null) {
      return Image.file(File(imagePath));
    } else {
      return Text('Aucune image sélectionnée');
    }
  }
}
