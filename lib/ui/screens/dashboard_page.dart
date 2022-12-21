import 'package:face_off/ui/shared/widgets/bottom_navbar.dart';
import 'package:face_off/ui/shared/widgets/dangerous_binary_option_buttons.dart';
import 'package:face_off/ui/shared/widgets/divider.dart';
import 'package:face_off/ui/widgets/dashboard_page/active_chat.dart';
import 'package:face_off/ui/widgets/dashboard_page/revealed_chat_line_item.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(CustomColors.dark_grey),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'face',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'off',
                style: TextStyle(
                  color: Color(CustomColors.green),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Anonymous Chats',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(CustomColors.white),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ActiveChat(
                  name: "Anonymous 1",
                  description: "typing...",
                  timeLeft: '24h Left',
                  active: true,
                  imgURL:
                      'assets/images/profile_pictures/anonymous_icon_1.jpg'),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: DangerousBinaryOptionButtons(
                      text1: "Request a Faceoff", text2: "Abandon Chat")),
              const SizedBox(
                height: 30,
              ),
              const LineDivider(length: 220),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Revealed Chats',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(CustomColors.white),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Revealed chats will expire in 48 hours if a meetup isn\'t scheduled',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(CustomColors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SizedBox(
                height: 150,
                child: ListView(
                  children: const [
                    RevealedChatLineItem(
                        name: "Aubrey Lin",
                        description: "I would love to meet up with you!",
                        timeDiff: '19h ago',
                        imgURL:
                            'assets/images/profile_pictures/anonymous_icon_5.jpg'),
                    SizedBox(
                      height: 10,
                    ),
                    RevealedChatLineItem(
                        name: "Samantha Lee",
                        description:
                            "You seem great but I am not really looking to ",
                        timeDiff: '32h ago',
                        imgURL:
                            'assets/images/profile_pictures/anonymous_icon_2.jpg'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ))),
        bottomNavigationBar: BottomNavbar());
  }
}
