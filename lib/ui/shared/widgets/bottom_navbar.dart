// ignore_for_file: non_constant_identifier_names

import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

Widget BottomNavbar() {
  return (Container(
    padding: const EdgeInsets.all(10),
    height: 50,
    color: const Color(CustomColors.dark_grey),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.home,
          color: Color(CustomColors.white),
        ),
        const Icon(
          Icons.menu,
          color: Color(CustomColors.white),
        ),
        CircleAvatar(
          radius: 15,
          backgroundImage:
              Image.asset('assets/images/profile_pictures/profile_pic_1.jpg')
                  .image,
        )
      ],
    ),
  ));
}
