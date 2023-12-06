import 'package:flutter/material.dart';

import '../../design/minimal_colors.dart';

class MinimalProgressIndicator extends StatelessWidget {
  const MinimalProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MinimalColors.black,
      ),
    );
  }
}
