import 'package:face_off/main.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:face_off/utils/constants.dart';
import '../models/message_model.dart' as msg;
import 'package:xmpp_plugin/xmpp_plugin.dart';
//import 'package:face_off/ui/widgets/chat_page/intervention_bubble.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  void _onError(Object error) {
    print(error.toString());
  }

  _textBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 42.0,
        width: 300.0,
        margin: const EdgeInsets.only(
          top: 25.0,
          bottom: 25.0,
          left: 15.0,
          right: 25.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: const BoxDecoration(
            color: Color(CustomColors.gray),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
              TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter a message...",
                      hintStyle: TextStyle(color: Color(CustomColors.white))),
                  style: TextStyle(
                    color: Color(CustomColors.white),
                    fontSize: 14.0,
                  ))
            ]),

        // FloatingActionButton(
        //   backgroundColor: Colors.amberAccent,
        //   onPressed: () {},
        //   child: Icon(
        //     Icons.train,
        //     size: 35,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      SizedBox(
          //<-- SEE HERE
          width: 42.0,
          height: 42.0,
          child: FittedBox(
              child: FloatingActionButton(
            backgroundColor: const Color(CustomColors.blue),
            onPressed: () {},
            child: const Icon(
              Icons.send,
              size: 25,
              color: Colors.black,
            ),
          ))),
    ]);
  }

  _buildMessage(msg.Message message, bool isMe) {
    return Container(
        margin: isMe
            ? const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 100.0,
                right: 15.0,
              )
            : const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                right: 100.0,
                left: 15.0,
              ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: isMe
                ? const Color(CustomColors.gray)
                : Color.fromARGB(255, 49, 152, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(CustomColors.white),
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 7.0),
              Text(message.text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(CustomColors.white),
                    fontWeight: FontWeight.w600,
                  )),
            ]));
  }

  @override
  void initState() {
    super.initState();
    connect().whenComplete(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CustomColors.background),
      appBar: AppBar(
          toolbarHeight: 73,
          backgroundColor: const Color(CustomColors.dark_grey),
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      iconSize: 5.0,
                      onPressed: () {},
                      icon: Image.asset('assets/images/back_arrow.png')),
                  const SizedBox(width: 20.0),
                  Container(
                      margin: const EdgeInsets.only(left: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Anonymous 1',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              color: const Color(CustomColors.white),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text('Male',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(CustomColors.white),
                              ))
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Active  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(CustomColors.white),
                      fontSize: 14,
                    ),
                  ),
                  CircleAvatar(
                      radius: 3, backgroundColor: Color(CustomColors.green))
                ],
              )
            ],
          )),
      body: Column(children: <Widget>[
        // const DynamicIsland(),
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                color: Color(CustomColors.background),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(top: 30),
                      itemCount: msg.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final msg.Message message = msg.messages[index];
                        final bool isMe =
                            message.sender.id == msg.currentUser.id;
                        return _buildMessage(message, isMe);
                      }))),
        ),
        _textBox(),
        const SizedBox(height: 20.0),
      ]),
    );
  }

  Future<void> connect() async {
    final auth = {
      "user_jid": "test@desktop-gam0g7e/faceoff",
      "password": "qwerty",
      "host": "192.168.86.29",
      "port": '5222',
      "requireSSLConnection": true,
      "autoDeliveryReceipt": true,
      "useStreamManagement": false,
      "automaticReconnection": true,
    };

    XmppConnection connection = XmppConnection(auth);
    await connection.start(_onError);
    await connection.login();
    var id = SharedPrefs().id.toString() +
        DateTime.now().millisecondsSinceEpoch.toString();
    await connection.sendMessageWithType("test2@desktop-gam0g7e",
        "This is a test message", id, DateTime.now().millisecondsSinceEpoch);
  }
}
