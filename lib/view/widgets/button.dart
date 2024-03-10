import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final String buttonTitle;
  final IconData? buttonIcon;
  final Future<Widget?> Function() function;
  Widget? imagePath;

  Button1(
      {Key? key,
      required this.buttonTitle,
      required this.function,
      this.imagePath,
      required this.buttonIcon})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: const BoxDecoration(borderRadius: BorderRadius.horizontal(
        left: Radius.circular(100),
        right: Radius.circular(100)
      ),),
      child: ElevatedButton(
        
        onPressed: () async {
          var selectedImagePath = await function();

          // Handle the result properly

          imagePath = selectedImagePath;
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: IntrinsicHeight(
                        child: imagePath!,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("send image"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Set the border radius here
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





