// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:face_off/ui/screens/login_page.dart';
import 'package:face_off/ui/screens/otp_verification.dart';
import 'package:face_off/ui/screens/question_1.dart';
import 'package:face_off/ui/shared/widgets/divider.dart';
import 'package:face_off/utils/common_ui.dart';
import 'package:face_off/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/apis.dart';
import '../shared/color_items/square_top_down_gradient.dart';
import '../shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> genders = <String>['Male', 'Female', 'Other'];
const imgPaths = [
  'assets/images/relationship_type/friends.png',
  'assets/images/relationship_type/dating.png'
];

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    // TODO: implement initState
    if (SharedPrefs().is_first_open == true) {
      SharedPrefs().is_first_open = false;
    }
  }

  // text editing controllers
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final pControl = TextEditingController();
  final passwordController = TextEditingController();
  final rpasswordController = TextEditingController();
  final genderController = TextEditingController();

  // sign user in method
  void signUserIn() {}
  int activeIndex = 0;
  String? gender = null;
  String? type = null;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (index) => setState(() => activeIndex = index),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter a phone number and password to create an account with faceoff",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                controller: pControl,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                    color: Color(CustomColors.white)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(CustomColors.white))),
                                  labelStyle: TextStyle(
                                      color: Color(CustomColors.white)),
                                  labelText: 'Phone Number',
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                style: const TextStyle(
                                    color: Color(CustomColors.white)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(CustomColors.white))),
                                  labelStyle: TextStyle(
                                      color: Color(CustomColors.white)),
                                  labelText: 'Password',
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                controller: rpasswordController,
                                obscureText: true,
                                style: const TextStyle(
                                    color: Color(CustomColors.white)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(CustomColors.white))),
                                  labelStyle: TextStyle(
                                      color: Color(CustomColors.white)),
                                  labelText: 'Confirm Password',
                                ))),
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already a member?',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Color(CustomColors.green),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        WideDarkBackgroundButton(
                            displayText: "Continue",
                            onTap: () {
                              if (pControl.text == '' ||
                                  passwordController.text == '' ||
                                  rpasswordController.text == '') {
                                showAlertDialog(context,
                                    "Atleast one of the required fields is blank");
                              } else if ((pControl.text.toString()).length !=
                                  10) {
                                showAlertDialog(
                                    context, "Enter a 10 digit phone number");
                              } else if (passwordController.text !=
                                  rpasswordController.text) {
                                showAlertDialog(
                                    context, "Your passwords do not match");
                              } else {
                                setState(() => activeIndex = 1);
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              }
                            }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter your personal details and preferences before we can continue setting up your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(CustomColors.white), fontSize: 18),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                controller: fnameController,
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                    color: Color(CustomColors.white)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(CustomColors.white))),
                                  labelStyle: TextStyle(
                                      color: Color(CustomColors.white)),
                                  labelText: 'First Name',
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                controller: lnameController,
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                    color: Color(CustomColors.white)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(CustomColors.white))),
                                  labelStyle: TextStyle(
                                      color: Color(CustomColors.white)),
                                  labelText: 'Last Name',
                                ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: gender,
                              elevation: 16,
                              dropdownColor:
                                  const Color(CustomColors.dark_grey),
                              style: const TextStyle(
                                  color: Color(CustomColors.white),
                                  fontSize: 18),
                              underline: Container(
                                height: 1,
                                color: const Color(CustomColors.white),
                              ),
                              hint: const Text('Gender',
                                  style: TextStyle(
                                      color: Color(CustomColors.white))),
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              items: genders.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                            )),
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already a member?',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Color(CustomColors.green),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        WideDarkBackgroundButton(
                            displayText: "Questions",
                            onTap: () {
                              setState(() => activeIndex = 1);
                              if (fnameController.text == '' ||
                                  lnameController.text == '' ||
                                  gender == null) {
                                showAlertDialog(context,
                                    "Atleast one of the required fields is blank");
                              } else {
                                setState(() => activeIndex = 1);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuestionOnePage()));
                              }

                              signupUser(
                                  pControl.value.text,
                                  fnameController.text,
                                  lnameController.text,
                                  genders.indexOf(gender!),
                                  passwordController.text,
                                  context);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 2,
                effect: const ScrollingDotsEffect(
                    spacing: 10.0,
                    activeDotColor: Color(CustomColors.gray),
                    dotColor: Color(CustomColors.dark_grey)),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future signupUser(String phone_number, String first_name, String last_name,
      int gender, String password, BuildContext context) async {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    final form = [];
    form.add("phone_number=$phone_number");
    form.add("first_name=$first_name");
    form.add("last_name=$last_name");
    form.add("gender=$gender");
    form.add("password=$password");
    final body = form.join('&');

    final response = await http.post(Uri.parse(ApiUrls.url_signup),
        headers: headers, body: body);
    final responseJSON = json.decode(response.body);
    if (responseJSON['error'] == false) {
      SharedPrefs().id = responseJSON['user_id'];
      SharedPrefs().phone_number = responseJSON['phone_number'];
      SharedPrefs().first_name = responseJSON['first_name'];
      SharedPrefs().last_name = responseJSON['last_name'];
      SharedPrefs().gender = responseJSON['gender'];
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => OtpVerification(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
      print("Sweet");
    } else {
      print(responseJSON['message']);
    }
  }
}
