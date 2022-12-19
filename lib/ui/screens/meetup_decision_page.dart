import 'package:face_off/ui/shared/widgets/binary_option_buttons.dart';
import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class MeetupDecisionPage extends StatefulWidget {
  const MeetupDecisionPage({Key? key}) : super(key: key);

  @override
  State<MeetupDecisionPage> createState() => _MeetupDecisionPageState();
}

class _MeetupDecisionPageState extends State<MeetupDecisionPage> {
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
                'Success!',
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
                            'assets/images/profile_pictures/profile_pic_2.jpg')
                        .image,
                  ),
                  105),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Anonymous 1 is...',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(CustomColors.white)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Adithya Bharath',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(CustomColors.white)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Do you want to meet Adithya?',
                style:
                    TextStyle(color: Color(CustomColors.white), fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              const BinaryOptionButtons(text1: "Yes", text2: "No"),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(text: '', children: <TextSpan>[
                      TextSpan(
                          text: 'You will ',
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18)),
                      TextSpan(
                          text: 'not ',
                          style: TextStyle(
                              color: Color(CustomColors.white),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'be able to schedule a meeting if your chatting partner says no.',
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18))
                    ])),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
