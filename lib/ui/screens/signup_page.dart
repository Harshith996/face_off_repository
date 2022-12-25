import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../shared/widgets/wide_dark_background_button.dart';
import '../shared/widgets/square_tile.dart';
import '../shared/widgets/custom_text_field.dart';
import 'package:face_off/utils/constants.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  // text editing controllers
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final pControl = TextEditingController();
  final passwordController = TextEditingController();
  final rpasswordController = TextEditingController();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'face',
                    style: GoogleFonts.montserrat(
                      fontSize: 50,
                      color: const Color(CustomColors.white),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('off',
                      style: GoogleFonts.montserrat(
                        fontSize: 50,
                        color: const Color(CustomColors.green),
                        fontWeight: FontWeight.w700,
                      ))
                ],
              ),

              const SizedBox(height: 20),

              Text(
                'Welcome to Faceoff',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

            Text(
                'First Name:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
              // username textfield
              MyTextField(
                controller: fnameController,
                hintText: 'John',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              Text(
                'Last Name:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),

              MyTextField(
                controller: lnameController,
                hintText: 'Doe',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              Text(
                'Phone Number:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),

              MyTextField(
                controller: pControl,
                obscureText: false,
                hintText: '(123) 456-7890',
              ),
              q
              const SizedBox(height: 20),

              Text(
                'Password:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: '',
                obscureText: true,
              ),

              const SizedBox(height: 35),

              Text(
                'Retype Password:',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),

              MyTextField(
                controller: rpasswordController,
                hintText: '',
                obscureText: true,
              ),
            
              // sign in button
              const WideDarkBackgroundButton(displayText: 'Register'),

              const SizedBox(height: 20),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
