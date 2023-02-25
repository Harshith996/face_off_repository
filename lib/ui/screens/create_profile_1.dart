import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/ui/shared/color_items/circular_top_down_gradient.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  int activeIndex = 0;
  CarouselController carouselController = CarouselController();
  // ignore: non_constant_identifier_names
  final anonymous_icons = [
    'assets/images/profile_pictures/anonymous_icon_1.jpg',
    'assets/images/profile_pictures/anonymous_icon_2.jpg',
    'assets/images/profile_pictures/anonymous_icon_3.jpg',
    'assets/images/profile_pictures/anonymous_icon_4.jpg',
    'assets/images/profile_pictures/anonymous_icon_5.jpg',
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
              'Create your Anonymous Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 50,
            ),

            const Text('Choose an anonymous icon',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Color(CustomColors.white), fontSize: 18)),

            const SizedBox(
              height: 27,
            ),

            // Image Slider
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: anonymous_icons.length,
                  itemBuilder: (context, index, realIndex) {
                    final imgPath = anonymous_icons[index];
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
              height: 10,
            ),

            // Follow up Text
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(text: '', children: <TextSpan>[
                TextSpan(
                    text:
                        'Your anonymous icon is visible to everyone you text. Choose something that (kind of) shows off your personality. ',
                    style: TextStyle(
                        fontSize: 18, color: Color(CustomColors.white)))
              ]),
            ),
            const SizedBox(
              height: 40,
            ),

            // Button to Choose
            WideDarkBackgroundButton(
              displayText: "Continue",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionOnePage()));
              },
            )
          ],
        )))));
  }
}

Widget buildImage(String imgPath, int index) {
  return (CircularTopDownGradient(
      radius: 126,
      color1: const Color(CustomColors.green),
      color2: const Color(CustomColors.blue),
      child: CircleAvatar(
        radius: 120,
        backgroundImage: Image.asset(imgPath).image,
      )));
}
