// ignore_for_file: unused_import, file_names, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:img/controller/selectImg.dart';

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
              ElevatedButton(
                
                onPressed: () async {
                  final selectedImagePath = await userController.afficheImageGallery();
                  setState(() {
                    imagePath = selectedImagePath;
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        
                        return IntrinsicHeight(

                          child:Column (children: [
                            IntrinsicHeight(
                              child :imagePath!
                            ),
                            ElevatedButton(onPressed: (){

                            },
                            
                            child:  const Text("send photo"),                     
                               ),
                          ],
                          
                          )
                          
                          
                          
                          );
                      },
                    );
                  });
                },
                
            
                    child:  Column(
                    children: const [
                          Icon(Icons.photo) ,
                          Text('gallery')
                    ],
                  )
                
              ),
               ElevatedButton(
                onPressed: () async {
                  final selectedImagePath = await userController.afficheImageCamera();
                  setState(() {
                    imagePath = selectedImagePath;
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return IntrinsicHeight(

                          child:Column (children: [
                            IntrinsicHeight(
                              child :imagePath!
                            ),
                            ElevatedButton(onPressed: (){

                            },
                            
                            child:  const Text("send photo"),  
                                               
                               ),
                          ],
                          
                          )
                          
                          
                          
                          );
                      },
                    );
                  });
                },
                child:  Column(
                    children: const [
                          Icon(Icons.camera_alt_rounded) ,
                          Text('camera'),
                    ],
                  ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
