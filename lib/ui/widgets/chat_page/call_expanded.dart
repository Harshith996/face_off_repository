import 'package:flutter/material.dart';

class CallExpanded extends StatelessWidget {
  const CallExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: const [
          Text(
            "intervention expanded",
            textAlign: TextAlign.center,
            )
        ],)
    );
  }
}