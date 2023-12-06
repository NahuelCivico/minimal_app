import 'package:flutter/material.dart';

import 'package:minimal_app/core/helpers/minimal_constants.dart';

class MinimalLogoImage extends StatelessWidget {
  final double size;

  const MinimalLogoImage({
    Key? key,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MinimalConstants.logoImage,
      height: size,
    );
  }
}
