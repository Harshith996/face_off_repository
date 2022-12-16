import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  const SignUpScreen({Key? key}) : super(key: key);

@override
  State<SignUpScreen> createState() => _SignUpScreen();

}

class _SignUpScreen extends State<SignUpScreen> 
{

  Widget build(BuildContext context)
  {
    return( 
      Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16) ,
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter your name here',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter your Email ID here'
              ),
            ),
          ),
        ]
      )
    );
  }
}