import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/create_profile_1.dart';
import 'package:face_off/ui/screens/dashboard_page.dart';
import 'package:face_off/ui/screens/enter_details_page.dart';
import 'package:face_off/ui/screens/loading_page.dart';
import 'package:face_off/ui/screens/login_page.dart';
import 'package:face_off/ui/screens/otp_verification.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/question_2.dart';
import 'package:face_off/ui/screens/question_3.dart';
import 'package:face_off/ui/screens/question_4.dart';
import 'package:face_off/ui/screens/question_5.dart';
import 'package:face_off/ui/screens/signup_page.dart';
import 'package:face_off/ui/screens/splash_screen.dart';
import 'package:face_off/ui/screens/test_page.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TestPage(),
    );
  }
}
