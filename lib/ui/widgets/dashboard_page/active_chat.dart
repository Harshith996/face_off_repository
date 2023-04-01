// import 'dart:io';
// import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
// import 'package:face_off/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:face_off/ui/screens/take_picture_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../utils/common_ui copy.dart';
// import '../../../utils/common_ui.dart';

// // var firstCamera;
// // Future<void> whatever() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   final cameras = await availableCameras();
// //   firstCamera = cameras[1];
// // }
// List pictures = [];
// List picturesString = [];
// Future pickImage(pictureID) async {
//   try {
//     final picture = await ImagePicker().pickImage(source: ImageSource.camera);

//     if (picture == null) return;

//     final picTemp = File(picture.path);

//     setState(
//       () {
//         pictures[pictureID] = picTemp;
//         picturesString[pictureID] = pictures[pictureID]!.path;
//       },
//     );
//   } catch (err) {
//     print("Error picking Picture from Gallery: $err");
//   }
// }

// // Future pickImages(pictureID) async {
// //   try {
// //     final picture = await ImagePicker().pickImage(source: ImageSource.camera);

// //     if (picture == null) return;

// //     final picTemp = File(picture.path);

// //     setState(() {
// //       pictures[pictureID] = picTemp;
// //     });
// //   } catch (err) {
// //     print("Error picking picture from gallery: $err");
// //   }
// // }

// class ActiveChat extends StatelessWidget {
//   const ActiveChat(
//       {super.key,
//       required this.name,
//       required this.description,
//       required this.timeLeft,
//       required this.flip,
//       required this.imgURL});

//   final String name;
//   final String description;
//   final String timeLeft;
//   final bool flip;
//   final String imgURL;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircularGradientBorder(
//             CircleAvatar(
//               radius: 30,
//               backgroundImage: Image.asset(imgURL).image,
//             ),
//             34),
//         const SizedBox(
//           width: 15,
//         ),
//         Expanded(
//           child: Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     name,
//                     textAlign: TextAlign.left,
//                     style: const TextStyle(
//                         color: Color(CustomColors.white),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   // Text(
//                   //   timeLeft,
//                   //   textAlign: TextAlign.left,
//                   //   style: const TextStyle(
//                   //     color: Color(CustomColors.white),
//                   //     fontSize: 15,
//                   //   ),
//                   // ),
//                 ],
//               ),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     description,
//                     textAlign: TextAlign.left,
//                     style: const TextStyle(
//                         color: Color(CustomColors.white),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           pickImage(0);
//                           // showAlertOptionDialog(
//                           //     context, "Do you want to reveal your identity?",
//                           //     onPressed: () {
//                           //   Navigator.push(
//                           //       context,
//                           //       MaterialPageRoute(
//                           //           builder: (context) => TakePictureScreen(
//                           //                 camera: firstCamera,
//                           //               )));
//                           // });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(50.0, 40.0),
//                           shape: const StadiumBorder(),
//                           backgroundColor: flip
//                               ? const Color(CustomColors.white)
//                               : const Color(CustomColors.gray),
//                           // padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
//                         ),
//                         child: Text(
//                           "Flip",
//                           style: GoogleFonts.inter(
//                               color: const Color(CustomColors.background)),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
