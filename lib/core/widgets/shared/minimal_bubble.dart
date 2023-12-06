import 'package:flutter/material.dart';

import '../../design/minimal_colors.dart';

class MinimalBubble extends StatelessWidget {
  final double size;
  final bool isStrong;

  const MinimalBubble({
    Key? key,
    required this.size,
    this.isStrong = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isStrong
            ? RadialGradient(
                colors: [
                  MinimalColors.lima.withOpacity(1.0),
                  MinimalColors.lima.withOpacity(0.9),
                  MinimalColors.lima.withOpacity(0.8),
                  MinimalColors.lima.withOpacity(0.6),
                  MinimalColors.lima.withOpacity(0.4),
                  MinimalColors.lima.withOpacity(0.2),
                  MinimalColors.lima.withOpacity(0.1),
                ],
                stops: const [0.0, 0.1, 0.2, 0.4, 0.6, 0.8, 1.0],
              )
            : RadialGradient(
                colors: [
                  MinimalColors.lima.withOpacity(0.6),
                  MinimalColors.lima.withOpacity(0.5),
                  MinimalColors.lima.withOpacity(0.45),
                  MinimalColors.lima.withOpacity(0.40),
                  MinimalColors.lima.withOpacity(0.35),
                  MinimalColors.lima.withOpacity(0.30),
                  MinimalColors.lima.withOpacity(0.25),
                  MinimalColors.lima.withOpacity(0.20),
                  MinimalColors.lima.withOpacity(0.15),
                  MinimalColors.lima.withOpacity(0.10),
                  MinimalColors.lima.withOpacity(0.05),
                ],
                stops: const [
                  0.0,
                  0.1,
                  0.2,
                  0.3,
                  0.4,
                  0.45,
                  0.5,
                  0.55,
                  0.65,
                  0.75,
                  1.0
                ],
              ),
      ),
    );
  }
}
