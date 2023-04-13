import 'dart:io';
import 'package:face_off/ui/screens/reveal_decision_page.dart';
import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:face_off/ui/screens/take_picture_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/common_ui copy.dart';
import '../../../utils/common_ui.dart';

class ActiveChat extends StatefulWidget {
  final String name;
  final String description;
  final String timeLeft;
  final bool flip;
  final String imgURL;
  const ActiveChat(
      {super.key,
      required this.name,
      required this.description,
      required this.timeLeft,
      required this.flip,
      required this.imgURL});

  @override
  State<ActiveChat> createState() => _ActiveChatState();
}

class _ActiveChatState extends State<ActiveChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularGradientBorder(
            CircleAvatar(
              radius: 30,
              backgroundImage: Image.asset(widget.imgURL).image,
            ),
            34),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(CustomColors.white),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   timeLeft,
                  //   textAlign: TextAlign.left,
                  //   style: const TextStyle(
                  //     color: Color(CustomColors.white),
                  //     fontSize: 15,
                  //   ),
                  // ),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(CustomColors.white),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RevealDecisionPage()));
                          // showAlertOptionDialog(
                          //     context, "Do you want to reveal your identity?",
                          //     onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => TakePictureScreen(
                          //                 camera: firstCamera,
                          //               )));
                          // });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50.0, 40.0),
                          shape: const StadiumBorder(),
                          backgroundColor: widget.flip
                              ? const Color(CustomColors.white)
                              : const Color(CustomColors.gray),
                          // padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                        ),
                        child: Text(
                          "Flip",
                          style: GoogleFonts.inter(
                              color: const Color(CustomColors.background)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
