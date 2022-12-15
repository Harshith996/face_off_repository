import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class WideDarkBackgroundButton extends StatelessWidget {
  const WideDarkBackgroundButton({
    super.key,
    required this.displayText,
  });
  final String displayText;

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(300, 70),
          shape: const StadiumBorder(),
          backgroundColor: const Color(CustomColors.grey),
          // padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
        ),
        child: Text(
          displayText,
          style: const TextStyle(
              fontSize: 20,
              color: Color(CustomColors.white),
              fontWeight: FontWeight.w500),
        ),
      ),
    ));
  }
}
