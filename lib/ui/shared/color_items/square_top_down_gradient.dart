// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class SquareTopDownGradient extends StatelessWidget {
  const SquareTopDownGradient(
      {super.key,
      required this.height,
      required this.width,
      required this.color1,
      required this.color2,
      required this.child});
  final double height;
  final double width;
  final Color color1;
  final Color color2;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return (Stack(
      alignment: Alignment.center,
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: height,
          width: width,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
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
