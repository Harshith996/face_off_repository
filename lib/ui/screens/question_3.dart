// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/question_4.dart';
import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs.dart';

class QuestionThreePage extends StatefulWidget {
  const QuestionThreePage({Key? key}) : super(key: key);

  @override
  State<QuestionThreePage> createState() => _QuestionThreePageState();
}

class _QuestionThreePageState extends State<QuestionThreePage> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  final hangout_spot_imgs = [
    'assets/images/hangout_spots/spot_1.jpg',
    'assets/images/hangout_spots/spot_2.jpg',
    'assets/images/hangout_spots/spot_3.jpg',
    'assets/images/hangout_spots/spot_4.jpg',
    'assets/images/hangout_spots/spot_5.jpg',
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
            const Spacer(),
            const Text(
              'Hanging Out',
              style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            // Image Slider
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: hangout_spot_imgs.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = hangout_spot_imgs[index];
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

            const Spacer(),

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
                      text: 'kind of setting ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(CustomColors.white))),
                  TextSpan(
                      text:
                          'you would feel most comfortable spending your free time',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                ]),
              ),
            ),
            const Spacer(),

            // Button to Choose
            WideDarkBackgroundButton(
              displayText: "Select and Continue",
              onTap: () {
                recordAnswer(3, SharedPrefs().id, activeIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => const QuestionFourPage(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 1000),
                  ),
                );
              },
            ),
            const Spacer(),
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
