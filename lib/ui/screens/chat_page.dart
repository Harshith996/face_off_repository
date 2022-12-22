import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:face_off/utils/constants.dart';

import '../models/message_model.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  _textBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 80,
        color: const Color(CustomColors.white),
        child: Row(
          children: const <Widget>[
            Expanded(
                child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Enter message here..')))
          ],
        ));
  }

  _buildMessage(Message message, bool isMe) {
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
                ? const Color.fromARGB(255, 70, 70, 70)
                : const Color.fromARGB(255, 0, 128, 255),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: const Color(CustomColors.white),
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 7.0),
              Text(message.text,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: const Color(CustomColors.white),
                    fontWeight: FontWeight.w600,
                  )),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 70, 70),
      appBar: AppBar(
          toolbarHeight: 73,
          backgroundColor: const Color.fromARGB(255, 70, 70, 70),
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Anonymous 178',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: const Color(CustomColors.white),
                  fontWeight: FontWeight.w600,
                ),
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
                      fontSize: 16,
                    ),
                  ),
                  CircleAvatar(
                      radius: 3, backgroundColor: Color(CustomColors.green))
                ],
              )
            ],
          )),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                color: Color(CustomColors.gray),
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
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }))),
        ),
        _textBox(),
      ]),
    );
  }
}
