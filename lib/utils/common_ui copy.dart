// ignore_for_file: depend_on_referenced_packages

// import 'dart:html';
import 'package:camera/camera.dart';
import 'package:face_off/ui/screens/anonymous_chat_page.dart';
import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/take_picture_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';
import 'constants.dart';

var firstCamera;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  firstCamera = cameras[0];
}

/////////////////////////////////////////////////////
// Alert Dialog
showAlertOptionDialog(BuildContext context, message,
    {required Function() onPressed}) {
  // set up the button

  Widget yesButton = TextButton(
    child: const Text(
      "Yes",
      style: TextStyle(color: Color(CustomColors.green)),
    ),
    onPressed: () async {
      final permitted = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => TakePictureScreen(
                  camera: firstCamera,
                )),
      );
      // dismiss dialog
    },
  );

  Widget noButton = TextButton(
    child: const Text(
      "No",
      style: TextStyle(color: Color(CustomColors.green)),
    ),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    contentPadding: const EdgeInsets.all(20.0),
    backgroundColor: const Color(CustomColors.background),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    actions: [
      yesButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
