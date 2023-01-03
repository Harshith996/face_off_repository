// ignore_for_file: non_constant_identifier_names

import 'package:face_off/ui/screens/dashboard_page.dart';
import 'package:face_off/ui/screens/signup_page.dart';
import 'package:face_off/utils/apis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/common_ui.dart';
import '../shared/widgets/wide_dark_background_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../shared/widgets/custom_text_field.dart';
import 'package:face_off/utils/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(CustomColors.background),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              SizedBox(
                height: 50,
                width: 200,
                child: Image.asset('assets/images/faceoff_logo.png'),
              ),

              const SizedBox(height: 40),
              Text(
                'Login to your FaceOff account',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                obscureText: false,
                inputType: TextInputType.phone,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                inputType: TextInputType.visiblePassword,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              WideDarkBackgroundButton(
                displayText: 'Sign In',
                onTap: () {
                  loginUser(phoneNumberController.text, passwordController.text,
                      context);
                },
              ),

              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Color(CustomColors.green),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loginUser(
      String phone_number, String password, BuildContext context) async {
    if (phone_number == '' || password == '') {
      showAlertDialog(context, 'Please fill in all the required details');
      return;
    }
    if (phone_number.length != 10) {
      showAlertDialog(context, 'Please enter a valid 10 digit phone number');
      return;
    }

    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final form = [];
    form.add("phone_number=$phone_number");
    form.add("password=$password");
    final body = form.join('&');

    final response = await http.post(Uri.parse(ApiUrls.url_login),
        headers: headers, body: body);
    final responseJSON = json.decode(response.body);
    if (responseJSON['error'] == false) {
      print("Sweet");
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const DashboardPage(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    } else {
      print(responseJSON['message']);
    }
  }
}
