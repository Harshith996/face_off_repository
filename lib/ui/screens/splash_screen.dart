// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:face_off/ui/screens/dashboard_page.dart';
import 'package:face_off/ui/screens/login_page.dart';
import 'package:face_off/ui/screens/signup_page.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    checkIsLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(CustomColors.background),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: Image.asset('assets/images/faceoff_logo.png'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Future<void> checkIsLogin(context) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final id = prefs.getInt("id") ?? -1;

  final id = SharedPrefs().id;

  final is_first_open = SharedPrefs().is_first_open;

  if (is_first_open) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => SignUpPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ),
            ));
    return;
  }

  if (id != -1) {
    print("alreay login.");
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const DashboardPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ),
            ));
  } else {
    print("New user");
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => LoginPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 1000),
              ),
            ));
    //your home page is loaded
  }
}
