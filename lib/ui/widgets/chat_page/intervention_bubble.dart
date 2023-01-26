import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';

class DynamicIsland extends StatefulWidget {
  const DynamicIsland({Key? key}) : super(key: key);

  @override
  State<DynamicIsland> createState() => _DynamicIslandState();
}

class _DynamicIslandState extends State<DynamicIsland>
    with TickerProviderStateMixin {
  late final AnimationController callRecController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late final Animation<double> _animation =
      CurvedAnimation(parent: callRecController, curve: Curves.fastOutSlowIn);
  late final AnimationController userController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late final Animation<double> _userAnimation =
      CurvedAnimation(parent: userController, curve: Curves.fastOutSlowIn);

  bool isRecAnimating = false;
  bool isUserAnimating = false;
  bool showBaseTile = true;

  void playRecording() {
    setState(() {
      showBaseTile = !showBaseTile;
      isRecAnimating = !isRecAnimating;
      if (isRecAnimating) {
        callRecController.reset();
      } else {
        callRecController.forward();
      }
    });
  }

  void playUserTile() {
    setState(() {
      showBaseTile = !showBaseTile;
      isUserAnimating = !isUserAnimating;
      if (isUserAnimating) {
        userController.forward();
      } else {
        userController.reset();
      }
    });
  }

  void clearCall() {
    setState(() {
      showBaseTile = true;
      isRecAnimating = false;
      isUserAnimating = false;
      callRecController.reset();
      userController.reset();
    });
  }

  @override
  void dispose() {
    callRecController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    callRecordingChip() {
      return SizeTransition(
          sizeFactor: _animation,
          axis: Axis.horizontal,
          child: GestureDetector(
            onTap: () {
              playUserTile();
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: Row(
                children: const [
                  Spacer(),
                  Text("your ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("face",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("off ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(CustomColors.green),
                          fontWeight: FontWeight.bold)),
                  Text("challenge",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ));
    }

    notificationChip() {
      return SizeTransition(
          sizeFactor: _userAnimation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: GestureDetector(
            onTap: () {
              clearCall();
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              width: 400,
              height: 90,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 1),
                )
              ], borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Your Challenge Prompt",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text("Azhar Rivaldi",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ));
    }

    baseChip() {
      return AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: 1,
        child: GestureDetector(
          onTap: () {
            playRecording();
          },
          child: Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
          ),
        ),
      );
    }

    mainStack() {
      return Stack(
        alignment: Alignment.center,
        children: [
          baseChip(),
          callRecordingChip(),
          notificationChip(),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              mainStack(),
              const SizedBox(height: 200.0),
              const Text(
                "Flutter\nDynamic Island",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
