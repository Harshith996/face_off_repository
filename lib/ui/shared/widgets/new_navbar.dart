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
  int _selectedIndex = 0;
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(CustomColors.dark_grey),
          currentIndex: _selectedIndex,
          onTap: (int index) {
            if (index == 1) {
              setState(() => _selectedIndex = 1);
            } else {
              setState(() => _selectedIndex = 0);
            }
          },
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person))
          ],
          selectedItemColor: const Color(CustomColors.blue),
          unselectedItemColor: Colors.white,
          unselectedFontSize: 10,
          selectedFontSize: 12,
        ),
      ),
    );

    // Container(
    //     color: const Color(CustomColors.gray),
    //     child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    //         child: GNav(
    //             backgroundColor: Color(CustomColors.gray),
    //             color: Colors.white,
    //             activeColor: Colors.white,
    //             tabBackgroundColor: Colors.black,
    //             iconSize: 20,
    //             padding: EdgeInsets.all(16.0),
    //             gap: 8,
    //             tabs: [
    //               GButton(
    //                   icon: Icons.home,
    //                   text: 'Home',
    //                   onPressed: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) =>
    //                                 const AnonymousChatPage()));
    //                   }),
    //               GButton(
    //                 icon: Icons.menu,
    //                 text: 'Menu',
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => const RevealedChatPage()));
    //                 },
    //               ),
    //             ]))
    //             );
  }
}
