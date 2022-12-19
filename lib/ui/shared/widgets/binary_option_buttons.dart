import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class BinaryOptionButtons extends StatelessWidget {
  const BinaryOptionButtons({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(140, 60),
                shape: const StadiumBorder(),
                backgroundColor: const Color(CustomColors.grey),
                // padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              ),
              child: Text(
                text1,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(CustomColors.white),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(140, 60),
                shape: const StadiumBorder(),
                backgroundColor: const Color(CustomColors.grey),
                // padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              ),
              child: Text(
                text2,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(CustomColors.white),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        )));
  }
}
