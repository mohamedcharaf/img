// ignore_for_file: unused_import, file_names, sized_box_for_whitespace, avoid_print, must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/constants/appImages.dart';
import 'package:img/constants/appbodytext.dart';
import 'package:img/controller/img_controller.dart';

import 'package:img/view/widgets/customeBodyText.dart';
import 'package:img/view/widgets/customeImage.dart';
import 'package:img/view/widgets/customeTitle.dart';
import 'package:img/view/widgets/buttonSelectImg.dart';
import 'package:lottie/lottie.dart';

class SelectImg extends StatelessWidget {
  SelectImg({Key? key, required this.title}) : super(key: key);
  final String title;

  String? imagePath;
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
                speed:0.1,

              ),
              const CustomeTitle(
                title: "Choose Image",
                size: 40,
              ),
              CustomeBodyText(body_: AppBodyText.choosePhoto),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonSelectImg(
                    buttonIcon: Icons.photo,
                    buttonTitle: "Gallery",
                    isGallery: true,

                    // function: () {
                    //   return controller
                    //       .afficheImage(ImageSource.gallery);
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonSelectImg(
                    buttonIcon: Icons.camera_alt_outlined,
                    buttonTitle: "Camera",
                    isGallery: false,
                    // function: () async {
                    //   return controller
                    //       .afficheImage(ImageSource.camera);
                    // },
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
