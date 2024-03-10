import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  final String buttonTitle;
  final IconData? buttonIcon;
  final Future<Widget?> Function() function;
  Widget? imagePath;

  Button1({Key? key, required this.buttonTitle, required this.function, this.imagePath, required this.buttonIcon})
      //: super(key: key)
      ;

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var selectedImagePath = await widget.function();
        setState(() {
          // Handle the result properly
          
            widget.imagePath = selectedImagePath;
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return IntrinsicHeight(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: widget.imagePath!,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(widget.buttonTitle),
                      ),
                    ],
                  ),
                );
              },
            );
          
        });
      },
      child: Column(
        children:  [
          Icon(widget.buttonIcon),
          Text(widget.buttonTitle),
        ],
      ),
    );
  }
}





