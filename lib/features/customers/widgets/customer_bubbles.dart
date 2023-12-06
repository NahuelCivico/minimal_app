import 'package:flutter/material.dart';

import '../../../core/widgets/shared/minimal_bubble.dart';

class CustomerBubbles extends StatelessWidget {
  const CustomerBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: -90,
          left: -100,
          child: MinimalBubble(size: 250, isStrong: false),
        ),
        Positioned(
          top: 260,
          right: -120,
          child: MinimalBubble(size: 300),
        ),
        Positioned(
          bottom: 50,
          left: -100,
          child: MinimalBubble(size: 200, isStrong: false),
        ),
        Positioned(
          bottom: -120,
          right: -100,
          child: MinimalBubble(size: 350, isStrong: false),
        ),
      ],
    );
  }
}
