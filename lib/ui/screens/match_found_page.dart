import 'dart:ffi';

import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class MatchFoundPage extends StatefulWidget {
  const MatchFoundPage({Key? key}) : super(key: key);

  @override
  State<MatchFoundPage> createState() => _MatchFoundPageState();
}

class _MatchFoundPageState extends State<MatchFoundPage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(CustomColors.background),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Match Found',
                style: TextStyle(
                    color: Color(CustomColors.white),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              CircularGradientBorder(
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: Image.asset(
                            'assets/images/profile_pictures/anonymous_icon_1.jpg')
                        .image,
                  ),
                  105),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Anonymous 1',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(CustomColors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Male',
                style:
                    TextStyle(fontSize: 18, color: Color(CustomColors.white)),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(text: '', children: <TextSpan>[
                      TextSpan(
                          text: 'Click the ',
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18)),
                      TextSpan(
                          text: 'button ',
                          style: TextStyle(
                              color: Color(CustomColors.white),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'below to chat with your match.',
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18))
                    ])),
              ),
              const SizedBox(
                height: 60,
              ),
              const WideDarkBackgroundButton(displayText: "Chat")
            ],
          ),
        ),
      ),
    ));
  }
}
