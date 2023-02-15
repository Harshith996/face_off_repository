// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/question_2.dart';
import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/apis.dart';

class QuestionOnePage extends StatefulWidget {
  const QuestionOnePage({Key? key}) : super(key: key);

  @override
  State<QuestionOnePage> createState() => _QuestionOnePageState();
}

class _QuestionOnePageState extends State<QuestionOnePage> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  final places_imgs = [
    'assets/images/places/place_1.jpg',
    'assets/images/places/place_2.jpg',
    'assets/images/places/place_3.jpg',
    'assets/images/places/place_4.jpg',
    'assets/images/places/place_5.jpg',
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
              'Pick a Place',
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
                  itemCount: places_imgs.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = places_imgs[index];
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
                      text: 'Select a ',
                      style: TextStyle(
                          fontSize: 20, color: Color(CustomColors.white))),
                  TextSpan(
                      text: 'location ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(CustomColors.white))),
                  TextSpan(
                      text:
                          'that you would love to pack your bags and leave for right now',
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
                recordAnswer(1, SharedPrefs().id, activeIndex);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => QuestionTwoPage(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 1000),
                  ),
                );
              },
            ),
            const Spacer()
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

Future recordAnswer(int question_id, int user_id, int answer) async {
  final headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };
  final form = [];
  form.add("question_id=$question_id");
  form.add("user_id=$user_id");
  form.add("answer=$answer");
  final body = form.join('&');

  final response = await http.post(Uri.parse(ApiUrls.url_answer_question),
      headers: headers, body: body);
  final responseJSON = json.decode(response.body);
  if (responseJSON['error'] == false) {
    print("Sweet");
  } else {
    print(responseJSON['message']);
  }
}
