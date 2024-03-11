// ignore_for_file: unused_import, file_names, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/constants/appImages.dart';
import 'package:img/controller/img_controller.dart';
import 'package:img/controller/selectImg.dart';
import 'package:img/view/widgets/customeBodyText.dart';
import 'package:img/view/widgets/customeImage.dart';
import 'package:img/view/widgets/customeTitle.dart';
import 'package:lottie/lottie.dart';
import 'package:img/view/widgets/button.dart';

class SelectImg extends StatelessWidget {
  SelectImg({Key? key, required this.title}) : super(key: key);
  final String title;

  Widget? imagePath;
  ImageController controller = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    // final UserController userController = UserController(context);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ImageController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeLottieImage(
                height: 260,
                path: AppImages.select,
              ),
              const CustomeTitle(
                title: "Choose Image",
                size: 40,
              ),
              const CustomeBodyText(
                  body:
                      "You can choose the perscription from your gallery or take an image for it"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button1(
                    buttonIcon: Icons.photo,
                    buttonTitle: "Gallery",
                    imagePath: imagePath,
                    function: () {
                      return controller
                          .afficheImageGallery2(ImageSource.gallery);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button1(
                    buttonIcon: Icons.camera_alt_outlined,
                    buttonTitle: "Camera",
                    function: () async {
                      return controller
                          .afficheImageGallery2(ImageSource.camera);
                    },
                    imagePath: imagePath,
                  )
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
