import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(CustomColors.background),
        body: SafeArea(
            child: Center(
          child: CircularGradientBorder(
              const CircleAvatar(
                radius: 80,
                backgroundColor: Color(CustomColors.aesthetic_red),
              ),
              100),
        )));
  }
}
