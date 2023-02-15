import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/screens/signup_page.dart';
import 'package:face_off/ui/shared/widgets/divider.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import '../../utils/apis.dart';
import '../shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'dashboard_page.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});

  // text editing controllers
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final pControl = TextEditingController();
  final passwordController = TextEditingController();
  final rpasswordController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    print(SharedPrefs().phone_number);
    requestOTP(SharedPrefs().phone_number, context);
    return Scaffold(
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(CustomColors.white),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: LineDivider(length: 70),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter the One Time Password sent to your phone number",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Color(CustomColors.white), fontSize: 18),
              ),
              const SizedBox(
                height: 150,
              ),
              Center(
                  child: OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(CustomColors.white),
                focusedBorderColor: const Color(CustomColors.blue),
                textStyle: const TextStyle(
                    fontSize: 30, color: Color(CustomColors.white)),
                keyboardType: TextInputType.number,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                onSubmit: (String otp) {
                  verifyOTP(SharedPrefs().id.toString(), otp, context);
                },
              )),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(CustomColors.background),
                      side: const BorderSide(
                          color: Color(CustomColors.background))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text(
                    "Restart Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(CustomColors.white)),
                  )),
              const Spacer(),
            ],
          ),
        )),
      ),
    );
  }

  Future requestOTP(String phone_number, BuildContext context) async {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final form = [];
    form.add("phone_number=$phone_number");
    final body = form.join('&');

    final response = await http.post(Uri.parse(ApiUrls.url_request_otp),
        headers: headers, body: body);
    final responseJSON = json.decode(response.body);
  }

  Future verifyOTP(String user_id, String otp, BuildContext context) async {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final form = [];
    form.add("user_id=$user_id");
    form.add("otp=$otp");
    final body = form.join('&');

    final response = await http.post(Uri.parse(ApiUrls.url_verify_otp),
        headers: headers, body: body);
    final responseJSON = json.decode(response.body);
    if (responseJSON['error'] == false) {
      print("Sweet");
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const QuestionOnePage(),
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
