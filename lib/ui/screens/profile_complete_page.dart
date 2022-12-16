import 'package:face_off/ui/widgets/profile_complete_page/animated_tick_mark.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/wide_dark_background_button.dart';

class ProfileCompletePage extends StatefulWidget {
  const ProfileCompletePage({Key? key}) : super(key: key);

  @override
  State<ProfileCompletePage> createState() => _ProfileCompletePageState();
}

class _ProfileCompletePageState extends State<ProfileCompletePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CustomColors.background),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Your Profile is Complete!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color(CustomColors.white)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const AnimatedTickMark(),
            const SizedBox(
              height: 40,
            ),
            FadeTransition(
              opacity: _animation,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(text: '', children: <TextSpan>[
                    TextSpan(
                        text: 'Click the ',
                        style: TextStyle(
                            fontSize: 20, color: Color(CustomColors.white))),
                    TextSpan(
                        text: 'button ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(CustomColors.white),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'below to find your first face',
                        style: TextStyle(
                            fontSize: 20, color: Color(CustomColors.white))),
                    TextSpan(
                        text: 'off ',
                        style: TextStyle(
                            fontSize: 20, color: Color(CustomColors.green))),
                    TextSpan(
                        text: 'match',
                        style: TextStyle(
                            fontSize: 20, color: Color(CustomColors.white))),
                  ])),
            ),
            const SizedBox(
              height: 40,
            ),
            FadeTransition(
              opacity: _animation,
              child: const WideDarkBackgroundButton(displayText: "Match Me"),
            )
          ],
        ),
      )),
    );
  }
}
