import 'package:flutter/material.dart';

class CallShrinked extends StatelessWidget {
  const CallShrinked({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "intervention shrunk",
          textAlign: TextAlign.center,
        )
      ],

    );
  }
}