import 'dart:async';

import 'package:face_off/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:face_off/utils/constants.dart';
import 'package:face_off/utils/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkIsLogin(context);
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
            RichText(
              text: const TextSpan(
                text: '',
                children: <TextSpan>[
                  TextSpan(
                      text: 'face',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.white)),
                  TextSpan(
                      text: 'off',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Color(CustomColors.background))),
                ],
              ),
            ),
          ],
        ))));
  }
}

Future<void> checkIsLogin(context) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final id = prefs.getInt("id") ?? -1;
  await SharedPrefs().init();
  final id = SharedPrefs().id;

  if (id != -1) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const LoginPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ),
            ));
  } else {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const LoginPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ),
            ));
    //your home page is loaded
  }
}
