import 'package:flutter/material.dart';

import '../../../core/widgets/shared/minimal_bubble.dart';

class LoginBubbles extends StatelessWidget {
  const LoginBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: -70,
          right: -150,
          child: MinimalBubble(size: 420),
        ),
        Positioned(
          top: 450,
          left: -140,
          child: MinimalBubble(size: 200),
        ),
        Positioned(
          bottom: -200,
          left: -20,
          child: MinimalBubble(size: 400, isStrong: false),
        ),
      ],
    );
  }
}
