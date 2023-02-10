import 'package:face_off/ui/shared/widgets/binary_option_buttons.dart';
import 'package:face_off/ui/shared/widgets/circular_gradient_border.dart';
import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  get child => null;


  void _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2010), 
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(CustomColors.gray),
              onPrimary: Color(CustomColors.white),
              onSurface: Colors.black,
            )
          ),
          child: child!,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(CustomColors.background),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Meet your match',
                style: TextStyle(
                    color: Color(CustomColors.white),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              CircularGradientBorder(
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: Image.asset(
                            'assets/images/profile_pictures/profile_pic_2.jpg')
                        .image,
                  ),
                  105),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Aditya Bharath',
                style: GoogleFonts.inter(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: const Color(CustomColors.white)),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(width: 50.0),
                  Container(
                    height: 180.0,
                    width: 300.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Pick a UCLA dining hall",
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              color: const Color(CustomColors.white),
                            )),
                        TextFormField(
                            style: const TextStyle(
                                color: Color(CustomColors.white)),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color(CustomColors.white))),
                            )),
                        const SizedBox(height: 30.0),
                        Text("Select a date to meet up",
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              color: const Color(CustomColors.white),
                            )),
                        GestureDetector( 
                          onTap: _showDatePicker,
                          child: TextFormField(
                            style: const TextStyle(
                                color: Color(CustomColors.white)),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color(CustomColors.white))),
                            ))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0)
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              WideDarkBackgroundButton(
                displayText: 'Schedule',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
