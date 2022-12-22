import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:face_off/utils/constants.dart';


// ignore: non_constant_identifier_names
Widget CustomNavbar() {
  return CurvedNavigationBar(
      backgroundColor: const Color(CustomColors.background),
      color: const Color(CustomColors.gray),
      animationDuration: const Duration(microseconds: 800),
      items: const [
      Icon(
          Icons.home,
          color: Color(CustomColors.white),
        ),
        Icon(
          Icons.menu,
          color: Color(CustomColors.white),
        ),
        Icon(
          Icons.settings,
          color: Color(CustomColors.white),
        ),
    ]);

}