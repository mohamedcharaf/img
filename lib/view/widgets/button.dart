// ignore_for_file: must_be_immutable, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img/controller/img_controller.dart';
import 'package:path/path.dart' as path;

class Button1 extends StatelessWidget {
  static ImageController controller = Get.put(ImageController());
  final String buttonTitle;
  final IconData? buttonIcon;
  final Future<String?> Function() function;


  Button1(
      {Key? key,
      required this.buttonTitle,
      required this.function,
      
      required this.buttonIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ImageController>(builder: (controller) {
        return Container(
          height: 50,
          width: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(100), right: Radius.circular(100)),
          ),
          child: ElevatedButton(
            onPressed: () async {
              var selectedImagePath =  await controller.afficheImageGallery2(ImageSource.gallery);
            
              if (selectedImagePath != null){
             

              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: IntrinsicHeight(
                            child: Image.file(File(selectedImagePath,))
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                           
                            controller.uploadImageToFirebaseStorage(selectedImagePath);
                            
                          },
                          child: const Text("send image"),
                        ),
                      ],
                    ),
                  );
                },
              );
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Set the border radius here
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
      }),
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





