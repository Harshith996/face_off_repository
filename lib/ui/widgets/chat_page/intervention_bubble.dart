import 'package:face_off/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'call_expanded.dart';
import 'call_shrinked.dart';

class InterventionBubble extends StatefulWidget {
  const InterventionBubble({super.key});

  @override
  State<InterventionBubble> createState() => _InterventionBubble();
}

class _InterventionBubble extends State<InterventionBubble> {

  int activePageIndex = 0;
  bool shrinked = true;
  final List<Island> islands =[
    const Island(
      shrunkIsland: CallShrinked(), 
      expandedIsland: CallExpanded(),
      expandedHeight: 50,
      expandedBorderRadius: 30)
  ];
  @override
  Widget build(BuildContext context) {

    final activeIsland = islands[activePageIndex];
    final islandToBeShown = shrinked ? activeIsland.shrunkIsland : activeIsland.expandedIsland;
    return Container(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: (() => setState(() {
          shrinked != shrinked;
        }
        )),
        child: AnimatedContainer(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(shrinked ? 20.0 : activeIsland.expandedBorderRadius)
          ),
          height: 20,
          width: MediaQuery.of(context).size.width * 0.5,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: islandToBeShown),
      )
    );
  }
}

class Island{
  const Island(
    {required this.shrunkIsland, 
    required this.expandedIsland,
    required this.expandedHeight,
    required this.expandedBorderRadius,
    }
  );
  final Widget shrunkIsland;
  final Widget expandedIsland;
  final double expandedHeight;
  final double expandedBorderRadius;

}