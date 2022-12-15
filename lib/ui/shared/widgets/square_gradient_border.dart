// ignore_for_file: non_constant_identifier_names

import 'package:face_off/ui/shared/color_items/square_top_down_gradient.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

Widget SquareGradientBorder(Widget item, double height, double width) =>
    SquareTopDownGradient(
        height: height,
        width: width,
        color1: const Color(CustomColors.green),
        color2: const Color(CustomColors.blue),
        child: item);
