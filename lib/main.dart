import 'package:face_off/ui/screens/anonymous_chat_page.dart';
import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/create_profile_1.dart';
import 'package:face_off/ui/screens/dashboard_page.dart';
import 'package:face_off/ui/screens/otp_verification.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/scheduling_page.dart';
import 'package:face_off/ui/screens/signup_page.dart';
import 'package:face_off/ui/screens/splash_screen.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:face_off/ui/screens/take_picture_screen.dart';
import 'package:camera/camera.dart';

var firstCamera;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.

  final cameras = await availableCameras();
  firstCamera = cameras[1];

  // Get a specific camera from the list of available cameras.

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
        home: CreateProfile());
  }
}
