import 'package:face_off/ui/screens/chat_page.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../utils/constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late IO.Socket socket;

  @override
  void initState() {
    initSocket();
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(CustomColors.background),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 200,
                child: Image.asset('assets/images/faceoff_logo.png'),
              ),
              const SizedBox(height: 60),
              const CircularProgressIndicator(
                backgroundColor: Color(CustomColors.gray),
                color: Color(CustomColors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'currently being matched...',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        )));
  }

  initSocket() {
    socket = IO.io("http://172.20.10.3:3000", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      socket.emit('user_id', SharedPrefs().id);
      print('Connection established');
    });
    socket.on(SharedPrefs().id.toString(), (data) {
      print(data);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => ChatPage(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 2000),
        ),
      );
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }
}
