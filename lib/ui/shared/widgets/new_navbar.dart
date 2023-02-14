import 'package:face_off/ui/screens/anonymous_chat_page.dart';
import 'package:face_off/ui/screens/revealed_chat_page.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavbar extends StatefulWidget {
  CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbar();
}

class _CustomNavbar extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(CustomColors.gray),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
                backgroundColor: Color(CustomColors.gray),
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black,
                iconSize: 20,
                padding: EdgeInsets.all(16.0),
                gap: 8,
                tabs: [
                  GButton(
                      icon: Icons.home,
                      text: 'Home',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AnonymousChatPage()));
                      }),
                  GButton(
                    icon: Icons.menu,
                    text: 'Menu',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RevealedChatPage()));
                    },
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Profile',
                  ),
                ])));
  }
}
