// ignore_for_file: non_constant_identifier_names

import 'package:face_off/ui/shared/color_items/circular_top_down_gradient.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

Widget CircularGradientBorder(Widget item, double radius) =>
    CircularTopDownGradient(
        radius: radius,
        color1: const Color(CustomColors.background),
        color2: const Color(CustomColors.accent),
        child: item);
