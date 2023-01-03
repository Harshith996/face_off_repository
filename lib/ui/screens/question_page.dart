// // ignore_for_file: non_constant_identifier_names

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
// import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
// import 'package:face_off/utils/constants.dart';
// import 'package:flutter/material.dart';

// class QuestionPage extends StatefulWidget {
//   const QuestionPage({Key? key}) : super(key: key);

//   @override
//   State<QuestionPage> createState() => _QuestionPageState();
// }

// class _QuestionPageState extends State<QuestionPage> {
//   int activeIndex = 0;
//   CarouselController carouselController = CarouselController();
//   final animal_imgs = [
//     'assets/images/spirit_animal/animal_1.jpg',
//     'assets/images/spirit_animal/animal_2.jpg',
//     'assets/images/spirit_animal/animal_3.jpg',
//     'assets/images/spirit_animal/animal_4.jpg',
//     'assets/images/spirit_animal/animal_5.jpg',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return (Scaffold(
//         backgroundColor: const Color(CustomColors.background),
//         body: SafeArea(
//             child: Center(
//                 child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Heading
//             const Text(
//               'Animal',
//               style: TextStyle(
//                   color: Color(CustomColors.white),
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             // Image Slider
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 CarouselSlider.builder(
//                   carouselController: carouselController,
//                   itemCount: animal_imgs.length,
//                   itemBuilder: (context, index, realIndex) {
//                     final imgPath = animal_imgs[index];
//                     return buildImage(imgPath, index);
//                   },
//                   options: CarouselOptions(
//                     height: 350,
//                     viewportFraction: 0.9,
//                     initialPage: 0,
//                     enableInfiniteScroll: true,
//                     enlargeCenterPage: true,
//                     scrollDirection: Axis.horizontal,
//                     onPageChanged: (index, reason) =>
//                         setState(() => activeIndex = index),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: IconButton(
//                     onPressed: () {
//                       // Use the controller to change the current page
//                       carouselController.previousPage();
//                     },
//                     icon: Image.asset('assets/images/back_arrow.png'),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: IconButton(
//                       onPressed: () {
//                         // Use the controller to change the current page
//                         carouselController.nextPage();
//                       },
//                       icon: Image.asset('assets/images/front_arrow.png')),
//                 ),
//               ],
//             ),

//             const SizedBox(
//               height: 40,
//             ),

//             // Follow up Text
//             RichText(
//               text: const TextSpan(text: '', children: <TextSpan>[
//                 TextSpan(
//                     text: 'Select your ',
//                     style: TextStyle(
//                         fontSize: 18, color: Color(CustomColors.white))),
//                 TextSpan(
//                     text: 'spirit animal.',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(CustomColors.white))),
//               ]),
//             ),
//             const SizedBox(
//               height: 40,
//             ),

//             // Button to Choose
//             const WideDarkBackgroundButton(displayText: "Continue")
//           ],
//         )))));
//   }
// }

// Widget buildImage(String img_path, int index) {
//   return (SquareTopDownGradient(
//       height: 265,
//       width: 265,
//       color1: const Color(CustomColors.green),
//       color2: const Color(CustomColors.blue),
//       child: SizedBox(
//         height: 260,
//         width: 260,
//         child: Image.asset(img_path),
//       )));
// }
