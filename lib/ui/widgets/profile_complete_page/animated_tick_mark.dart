import 'package:flutter/material.dart';

class AnimatedTickMark extends StatefulWidget {
  const AnimatedTickMark({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedTickMark();
  }
}

class _AnimatedTickMark extends State<AnimatedTickMark>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation2 =
      Tween<double>(begin: 0.0, end: 1.0).animate(_controller2);

  @override
  void initState() {
    super.initState();
    runOnce();
    _controller2.forward();
  }

  void runOnce() async {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: 200,
              child:
                  Image.asset('assets/images/tick_mark/tick_mark_circle.png'),
            ),
          ),
        ),
        FadeTransition(
          opacity: _animation2,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/tick_mark/tick_mark.png'),
          ),
        ),
      ],
    );
  }
}
