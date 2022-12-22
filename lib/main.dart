import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/dashboard_page.dart';
import 'package:face_off/ui/screens/enter_details_page.dart';
import 'package:face_off/ui/screens/match_found_page.dart';
import 'package:face_off/ui/screens/meetup_decision_page.dart';
import 'package:face_off/ui/screens/profile_complete_page.dart';
import 'package:face_off/ui/screens/create_profile_1.dart';
import 'package:face_off/ui/screens/question_page.dart';
import 'package:face_off/ui/screens/login_page.dart';
import 'package:face_off/ui/screens/reveal_decision_page.dart';
import 'package:flutter/material.dart';

void main() {
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
      home:  const ChatPage(),



    );
  }
}
