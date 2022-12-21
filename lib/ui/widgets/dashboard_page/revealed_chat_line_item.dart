import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class RevealedChatLineItem extends StatelessWidget {
  const RevealedChatLineItem(
      {super.key,
      required this.name,
      required this.description,
      required this.timeDiff,
      required this.imgURL});

  final String name;
  final String description;
  final String timeDiff;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularGradientBorder(
            CircleAvatar(
              radius: 35,
              backgroundImage: Image.asset(imgURL).image,
            ),
            40),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(CustomColors.white),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeDiff,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(CustomColors.white),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
