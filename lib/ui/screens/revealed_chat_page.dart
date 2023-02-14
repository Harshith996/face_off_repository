import 'package:face_off/ui/screens/loading_page.dart';
import 'package:face_off/ui/shared/widgets/bottom_navbar.dart';
import 'package:face_off/ui/shared/widgets/dangerous_binary_option_buttons.dart';
import 'package:face_off/ui/shared/widgets/divider.dart';
import 'package:face_off/ui/shared/widgets/new_navbar.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/ui/widgets/dashboard_page/active_chat.dart';
import 'package:face_off/ui/widgets/dashboard_page/revealed_chat_line_item.dart';
import 'package:face_off/utils/constants.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/wide_red_background_button.dart';

class RevealedChatPage extends StatefulWidget {
  const RevealedChatPage({Key? key}) : super(key: key);

  @override
  State<RevealedChatPage> createState() => _RevealedChatPageState();
}

class _RevealedChatPageState extends State<RevealedChatPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(CustomColors.background),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(CustomColors.background),
                onPressed: () {},
                child: const Icon(
                  Icons.account_circle,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 45.0,
                width: 100.0,
                child: Image.asset('assets/images/faceoff_logo.png'),
              ),
              FloatingActionButton(
                backgroundColor: const Color(CustomColors.background),
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(CustomColors.background),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SharedPrefs().is_currently_matched

                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Revealed Chats',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(CustomColors.white),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment(-0.97, 0),
                          child: LineDivider(length: 130),
                        ),
                      ])),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomNavbar());
  }
}
