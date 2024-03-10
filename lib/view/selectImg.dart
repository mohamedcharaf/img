// ignore_for_file: unused_import, file_names, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/controller/selectImg.dart';
import 'package:img/view/widgets/test.dart';

class SelectImg extends StatefulWidget {
  const SelectImg({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SelectImg> createState() => _SelectImgState();
}

class _SelectImgState extends State<SelectImg> {
  Widget? imagePath;

  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Select Image")),
      body: 
      Column(
        children: [
          Row(

            children: [
              Button1(buttonIcon: Icons.photo,
                buttonTitle: "Gallery",imagePath: imagePath,function:() async {
                return await userController.afficheImageGallery2(ImageSource.gallery); 
              },),
              Button1(buttonIcon: Icons.camera_alt_outlined,
                buttonTitle: "Camera", function: () async {
                return await userController.afficheImageGallery2(ImageSource.camera); 
              },imagePath: imagePath,)

            ],
          ),
        ],
      ),
    );
  }
}
