import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class ActiveChat extends StatelessWidget {
  const ActiveChat(
      {super.key,
      required this.name,
      required this.description,
      required this.timeLeft,
      required this.active,
      required this.imgURL});

  final String name;
  final String description;
  final String timeLeft;
  final bool active;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularGradientBorder(
            CircleAvatar(
              radius: 40,
              backgroundImage: Image.asset(imgURL).image,
            ),
            45),
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
                    name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(CustomColors.white),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    timeLeft,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(CustomColors.white),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        active ? "Active  " : "Offline  ",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color(CustomColors.white),
                          fontSize: 16,
                        ),
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: active
                            ? const Color(CustomColors.green)
                            : const Color(CustomColors.grey),
                      )
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
