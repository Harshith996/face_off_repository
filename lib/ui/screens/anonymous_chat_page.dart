import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/ui/screens/revealed_chat_page.dart';
import 'package:face_off/ui/shared/widgets/divider.dart';
import 'package:face_off/utils/constants.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:xmpp_plugin/success_response_event.dart';
import 'package:xmpp_plugin/models/present_mode.dart';
import 'package:xmpp_plugin/models/message_model.dart';
import 'package:xmpp_plugin/models/connection_event.dart';
import 'package:xmpp_plugin/models/chat_state_model.dart';
import 'package:xmpp_plugin/error_response_event.dart';
import 'package:xmpp_plugin/xmpp_plugin.dart';

import '../shared/widgets/wide_red_background_button.dart';
import '../widgets/dashboard_page/ractive_chat.dart';

class AnonymousChatPage extends StatefulWidget {
  const AnonymousChatPage({Key? key}) : super(key: key);

  @override
  State<AnonymousChatPage> createState() => _AnonymousChatPageState();
}

class _AnonymousChatPageState extends State<AnonymousChatPage>
    with WidgetsBindingObserver
    implements DataChangeEvents {
  int _selectedIndex = 0;
  static late XmppConnection connection;
  String currentMsg = "";
  bool isTyping = false;

  void _onError(Object error) {
    print(error.toString());
  }

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
  void initState() {
    // TODO: implement initState
    XmppConnection.addListener(this);
    connect().whenComplete(() => null);
    WidgetsBinding.instance.addObserver(this);
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
                  ? Column(
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
                              description: isTyping ? "typing..." : currentMsg,
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
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ))),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
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
        ));
  }

  Future<void> connect() async {
    final auth = {
      "user_jid":
          "test@ip-172-31-30-179.us-west-1.compute.internal/face-off-ios",
      "password": "qwerty",
      "host": "54.219.12.239",
      "port": '5222',
      "requireSSLConnection": true,
      "autoDeliveryReceipt": true,
      "useStreamManagement": false,
      "automaticReconnection": true,
    };

    connection = XmppConnection(auth);
    await connection.start(_onError);
    await connection.login();
    var id = SharedPrefs().id.toString() +
        DateTime.now().millisecondsSinceEpoch.toString();
    await connection.sendMessageWithType(
        "servertester@ip-172-31-30-179.us-west-1.compute.internal",
        "This is a test message",
        id,
        DateTime.now().millisecondsSinceEpoch);
    // connection.joinMucGroup("trial");
  }

  @override
  void onXmppError(ErrorResponseEvent errorResponseEvent) {
    print(
        'receiveEvent onXmppError: ${errorResponseEvent.toErrorResponseData().toString()}');
  }

  @override
  void onSuccessEvent(SuccessResponseEvent successResponseEvent) {
    print(
        'receiveEvent successEventReceive: ${successResponseEvent.toSuccessResponseData().toString()}');
  }

  @override
  void onChatMessage(MessageChat messageChat) {
    if (messageChat.body == "" || messageChat.body == null) {
      if (messageChat.chatStateType == "composing") {
        setState(() {
          isTyping = true;
        });
      } else if (messageChat.chatStateType == "paused" ||
          messageChat.chatStateType == "inactive" ||
          messageChat.chatStateType == "gone") {
        setState(() {
          isTyping = false;
        });
      }
    } else {
      setState(() {
        currentMsg = messageChat.body.toString();
      });
    }
    print('onChatMessage: ${messageChat.toEventData()}');
  }

  @override
  void onGroupMessage(MessageChat messageChat) {
    print('onGroupMessage: ${messageChat.toEventData()}');
  }

  @override
  void onNormalMessage(MessageChat messageChat) {
    print('onNormalMessage: ${messageChat.toEventData()}');
  }

  @override
  void onPresenceChange(PresentModel presentModel) {
    print('onPresenceChange ~~>>${presentModel.toJson()}');
  }

  @override
  void onChatStateChange(ChatState chatState) {
    print('onChatStateChange ~~>>$chatState');
  }

  @override
  void onConnectionEvents(ConnectionEvent connectionEvent) {
    print('onConnectionEvents ~~>>${connectionEvent.toJson()}');
    // connectionStatus = connectionEvent.type!.toConnectionName();
    // connectionStatusMessage = connectionEvent.error ?? '';
    setState(() {});
  }
}
