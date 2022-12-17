import 'package:face_off/ui/shared/widgets/wide_dark_background_button.dart';
import 'package:face_off/ui/shared/color_items/circular_top_down_gradient.dart';
import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {

  @override
  final imgPath = 'assets/images/profile_pictures/profile_pic_1.jpg';
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: const Color(CustomColors.background),
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading
            const Text(
              'Create your Anonymous Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(CustomColors.white),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
                height: 20,
            ),
            
            buildImage(imgPath),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: Color(CustomColors.white)),
                  decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Color(CustomColors.white))),
                  labelStyle: TextStyle(color: Color(CustomColors.white)),
                  labelText: 'First Name', 
            )
                )
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: Color(CustomColors.white)),
                  decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Color(CustomColors.white))),
                  labelStyle: TextStyle(color: Color(CustomColors.white)),
                  labelText: 'Last Name',
            )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: Color(CustomColors.white)),
                  decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Color(CustomColors.white))),
                  labelStyle: TextStyle(color: Color(CustomColors.white)),
                  labelText: 'Gender',
            )
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: Color(CustomColors.white)),
                  decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Color(CustomColors.white))),
                  labelStyle: TextStyle(color: Color(CustomColors.white)),
                  labelText: 'Interested in? (Dating/Friendships)',
            )
                )
            ),
             
             const SizedBox(
              height: 20
             ),

             RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(text: '', children: <TextSpan>[
                TextSpan(
                    text: 'Your name will be anonymous to the people you text. Your full name and profile picture is revealed after each messaging session.',
                    style: TextStyle(
                        fontSize: 16, color: Color(CustomColors.white)))
              ]),
            ),

            const SizedBox(
              height: 40
            ),
            const WideDarkBackgroundButton(displayText: "Continue"),
          ]
          )
          
            )
        )  
        )
    );
  
          
  }
}
  Widget buildImage(String imgPath) {
  return (CircularTopDownGradient(
      radius: 65,
      color1: const Color(CustomColors.green),
      color2: const Color(CustomColors.blue),
      child: CircleAvatar(
        radius: 62,
        backgroundImage: Image.asset(imgPath).image,
      )));
}


