// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/question_3.dart';
import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs.dart';

class QuestionTwoPage extends StatefulWidget {
  const QuestionTwoPage({Key? key}) : super(key: key);

  @override
  State<QuestionTwoPage> createState() => _QuestionTwoPageState();
}

class _QuestionTwoPageState extends State<QuestionTwoPage> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  final animal_imgs = [
    'assets/images/artists/group_1.png',
    'assets/images/artists/group_2.png',
    'assets/images/artists/group_3.png',
    'assets/images/artists/group_4.png',
    'assets/images/artists/group_5.png',
    'assets/images/artists/group_6.png',
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
              'Your Music Taste',
              textAlign: TextAlign.center,
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
                  itemCount: animal_imgs.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = animal_imgs[index];
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
                      text: 'Select a ',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'group of artists ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'would most likely feature at your concert ',
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
                recordAnswer(2, SharedPrefs().id, activeIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const QuestionThreePage(),
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
  return Container(
    child: Image.asset(img_path),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
    ),
    height: 260,
    width: 260,
  );
}
