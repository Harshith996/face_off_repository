// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/loading_page.dart';
import 'package:face_off/ui/screens/profile_complete_page.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs.dart';

class QuestionFivePage extends StatefulWidget {
  const QuestionFivePage({Key? key}) : super(key: key);

  @override
  State<QuestionFivePage> createState() => _QuestionFivePageState();
}

class _QuestionFivePageState extends State<QuestionFivePage> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  final hobbies = [
    'assets/images/hobbies/hobby_1.jpg',
    'assets/images/hobbies/hobby_2.jpg',
    'assets/images/hobbies/hobby_3.jpg',
    'assets/images/hobbies/hobby_4.jpg',
    'assets/images/hobbies/hobby_5.jpg',
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
              'Hobbies',
              style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 40,
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
                  itemCount: hobbies.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = hobbies[index];
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
                      text: 'Select something you would love to do in your  ',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'free time',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(CustomColors.white))),
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
                recordAnswer(5, SharedPrefs().id, activeIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const ProfileCompletePage(),
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
