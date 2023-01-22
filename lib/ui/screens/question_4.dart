// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/question_5.dart';
import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs.dart';

class QuestionFourPage extends StatefulWidget {
  const QuestionFourPage({Key? key}) : super(key: key);

  @override
  State<QuestionFourPage> createState() => _QuestionFourPageState();
}

class _QuestionFourPageState extends State<QuestionFourPage> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  final interests = [
    'assets/images/interests/interest_1.jpg',
    'assets/images/interests/interest_2.jpg',
    'assets/images/interests/interest_3.jpg',
    'assets/images/interests/interest_4.jpg',
    'assets/images/interests/interest_5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: const Color(CustomColors.background),
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading
            const Text(
              'Intellectual Interests',
              style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            // Image Slider
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: interests.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = interests[index];
                    return buildImage(imgPath, index);
                  },
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      // Use the controller to change the current page
                      carouselController.previousPage();
                    },
                    icon: Image.asset('assets/images/back_arrow.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        // Use the controller to change the current page
                        carouselController.nextPage();
                      },
                      icon: Image.asset('assets/images/front_arrow.png')),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            // Follow up Text
            Padding(
              padding: const EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(text: '', children: <TextSpan>[
                  TextSpan(
                      text: 'Select the ',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'field of study ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'that interests you the most',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            // Button to Choose
            WideDarkBackgroundButton(
              displayText: "Select and Continue",
              onTap: () {
                recordAnswer(4, SharedPrefs().id, activeIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const QuestionFivePage(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 1000),
                  ),
                );
              },
            )
          ],
        )))));
  }
}

Widget buildImage(String img_path, int index) {
  return (SquareTopDownGradient(
      height: 265,
      width: 265,
      color1: const Color(CustomColors.green),
      color2: const Color(CustomColors.blue),
      child: SizedBox(
        height: 260,
        width: 260,
        child: Image.asset(img_path),
      )));
}
