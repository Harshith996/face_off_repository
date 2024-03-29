import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/loading_page.dart';
import 'package:face_off/ui/screens/revealed_chat_page.dart';
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
import '../widgets/dashboard_page/ractive_chat.dart';

class AnonymousChatPage extends StatefulWidget {
  const AnonymousChatPage({Key? key}) : super(key: key);

  @override
  State<AnonymousChatPage> createState() => _AnonymousChatPageState();
}

class _AnonymousChatPageState extends State<AnonymousChatPage> {
  @override
  int _selectedIndex = 0;
  void initState() {}
  List<Widget> body = const [
    AnonymousChatPage(),
    RevealedChatPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                heroTag: "tag1",
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
                heroTag: 'tag2',
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
              _selectedIndex == 0
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Anonymous Chats',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(CustomColors.white),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Align(
                            alignment: Alignment(-0.97, 0),
                            child: LineDivider(length: 130),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 4,
                            width: 200,
                            child: Divider(
                              height: 1,
                              thickness: 2,
                              color: Color(CustomColors.gray),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage()));
                            },
                            child: ActiveChat(
                                name: "Anonymous 1",
                                description: "typing...",
                                timeLeft: '24h Left',
                                flip: true,
                                imgURL:
                                    'assets/images/profile_pictures/anonymous_icon_1.jpg'),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: DangerousBinaryOptionButtons(
                          //         text1: "Request a Faceoff",
                          //         text2: "Abandon Chat")),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Align(
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
                          const SizedBox(height: 10.0),
                          const Align(
                            alignment: Alignment(-0.97, 0),
                            child: LineDivider(length: 130),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 4,
                            width: 200,
                            child: Divider(
                              height: 1,
                              thickness: 2,
                              color: Color(CustomColors.gray),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatPage()));
                            },
                            child: const ActiveChat(
                                name: "Samantha Lee",
                                description: "typing...",
                                timeLeft: '24h Left',
                                flip: true,
                                imgURL:
                                    'assets/images/profile_pictures/anonymous_icon_2.jpg'),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: DangerousBinaryOptionButtons(
                          //         text1: "Request a Faceoff",
                          //         text2: "Abandon Chat")),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 4,
                width: 200,
                child: Divider(
                  height: 1,
                  thickness: 2,
                  color: Color(CustomColors.gray),
                ),
              ),

              // const SizedBox(
              //   height: 10,
              // ),
              // const ActiveChat(
              //     name: "Anonymous 2",
              //     description: "whatsup bro",
              //     timeLeft: '24h Left',
              //     flip: true,
              //     imgURL:
              //         'assets/images/profile_pictures/anonymous_icon_2.jpg'),

              // const SizedBox(
              //   height: 20,
              //   width: 200,
              //   child: Divider(
              //     height: 1,
              //     thickness: 2,
              //     color: Color(CustomColors.gray),
              //   ),
              // ),

              // const ActiveChat(
              //     name: "Anonymous 3",
              //     description: "brooo",
              //     timeLeft: '24h Left',
              //     flip: true,
              //     imgURL:
              //         'assets/images/profile_pictures/anonymous_icon_3.jpg'),
              // const SizedBox(
              //   height: 20,
              //   width: 200,
              //   child: Divider(
              //     height: 1,
              //     thickness: 2,
              //     color: Color(CustomColors.gray),
              //   ),
              // ),

              // const ActiveChat(
              //     name: "Anonymous 4",
              //     description: "henny",
              //     timeLeft: '24h Left',
              //     flip: true,
              //     imgURL:
              //         'assets/images/profile_pictures/anonymous_icon_4.jpg'),

              // const SizedBox(
              //   height: 20,
              //   width: 200,
              //   child: Divider(
              //     height: 1,
              //     thickness: 2,
              //     color: Color(CustomColors.gray),
              //   ),
              // ),

              // const ActiveChat(
              //     name: "Anonymous 5",
              //     description: "Hi!",
              //     timeLeft: '24h Left',
              //     flip: false,
              //     imgURL:
              //         'assets/images/profile_pictures/anonymous_icon_5.jpg'),
              // const SizedBox(
              //   height: 20,
              //   width: 200,
              //   child: Divider(
              //     height: 1,
              //     thickness: 2,
              //     color: Color(CustomColors.gray),
              //   ),
              // ),
              // : WideDarkBackgroundButton(
              //     displayText: "Match me",
              //     onTap: () {
              //       Navigator.pushReplacement(
              //         context,
              //         PageRouteBuilder(
              //           pageBuilder: (c, a1, a2) => const LoadingPage(),
              //           transitionsBuilder: (c, anim, a2, child) =>
              //               FadeTransition(opacity: anim, child: child),
              //           transitionDuration:
              //               const Duration(milliseconds: 1000),
              //         ),
              //       );
              //     }),

              const SizedBox(
                height: 30,
              ),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'Revealed Chats',
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: Color(CustomColors.white),
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              // const Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     'Revealed chats will expire in 48 hours if a meetup isn\'t scheduled',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Color(CustomColors.white),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              // Expanded(
              //     child: SizedBox(
              //   height: 150,
              //   child: ListView(
              //     children: const [
              //       RevealedChatLineItem(
              //           name: "Aubrey Lin",
              //           description: "I would love to meet up with you!",
              //           timeDiff: '19h ago',
              //           imgURL:
              //               'assets/images/profile_pictures/anonymous_icon_5.jpg'),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       RevealedChatLineItem(
              //           name: "Samantha Lee",
              //           description:
              //               "You seem great but I am not really looking to ",
              //           timeDiff: '32h ago',
              //           imgURL:
              //               'assets/images/profile_pictures/anonymous_icon_2.jpg'),
              //       SizedBox(
              //         height: 10,
              //       ),
              //     ],
              //   ),
              // ))
            ],
          ),
        ))),
        bottomNavigationBar: Container(
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
                BottomNavigationBarItem(
                    label: 'Anonymous', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Revealed', icon: Icon(Icons.menu)),
              ],
              selectedItemColor: const Color(CustomColors.blue),
              unselectedItemColor: Colors.white,
              unselectedFontSize: 10,
              selectedFontSize: 12,
            ),
          ),
        ));
  }

  void _onError(Object error) {
    // TODO : Handle the Error event
    print(error.toString());
  }
}
