// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class CircularTopDownGradient extends StatelessWidget {
  const CircularTopDownGradient(
      {super.key,
      required this.radius,
      required this.color1,
      required this.color2,
      required this.child});
  final double radius;
  final Color color1;
  final Color color2;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return (Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: radius,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [color1, color2])),
          ),
        ),
        child
      ],
    ));
  }
}
