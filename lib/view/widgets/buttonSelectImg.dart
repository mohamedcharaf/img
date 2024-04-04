// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors_in_immutables, dead_code, file_names, use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/controller/img_controller.dart';
import 'package:path/path.dart' as path;

import '../../z_test/listimage.dart';
import '../selectImg.dart';

class ButtonSelectImg extends StatelessWidget {
  static ImageController controller = Get.put(ImageController());
  final String buttonTitle;
  final IconData? buttonIcon;
  final bool isGallery;

  ButtonSelectImg({
    Key? key,
    required this.buttonTitle,
    required this.buttonIcon,
    this.isGallery = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ImageController>(
        builder: (controller) {
          return Container(
            height: 50,
            width: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(100),
                right: Radius.circular(100),
              ),
            ),
            child: ElevatedButton(
              onPressed: () async {
                String? selectedImagePath = await controller.afficheImage(
                  isGallery ? ImageSource.gallery : ImageSource.camera,
                );
                   Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PharmacyListScreen (selectedImagePath: selectedImagePath,),
      ),
    );

                if (selectedImagePath != null) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildImagePreview(context, selectedImagePath);
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(buttonIcon),
                  Text(buttonTitle),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagePreview(BuildContext context, String selectedImagePath) {
    return  
    // PharmacyListScreen ();
    IntrinsicHeight(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme l'écran
              },
            ),
          ),
          Expanded(
            child: IntrinsicHeight(
              child: Image.file(File(selectedImagePath)),
            ),
          ),
          ElevatedButton(
            child: const Text('choisir les pharmacy'),
           onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  const PharmacyListScreen(selectedImagePath: '',),
              ),
            );
          },
          )
              // _handleSendImage(context, selectedImagePath);
              //je veux ici affiche la liste des pharmacy et apres send image
            
        
          
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class Button1 extends StatefulWidget {
//   final String buttonTitle;
//   final IconData? buttonIcon;
//   final Future<Widget?> Function() function;
//   Widget? imagePath;

//   Button1({Key? key, required this.buttonTitle, required this.function, this.imagePath, required this.buttonIcon})
//       //: super(key: key)
//       ;

//   @override
//   State<Button1> createState() => _Button1State();
// }

// class _Button1State extends State<Button1> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         var selectedImagePath = await widget.function();
//         setState(() {
//           // Handle the result properly
          
//             widget.imagePath = selectedImagePath;
//             showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return IntrinsicHeight(
//                   child: Column(
//                     children: [
//                       IntrinsicHeight(
//                         child: widget.imagePath!,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Text(widget.buttonTitle),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
          
//         });
//       },
//       child: Column(
//         children:  [
//           Icon(widget.buttonIcon),
//           Text(widget.buttonTitle),
//         ],
//       ),
//     );
//   }
// }





