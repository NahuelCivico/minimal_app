import 'package:flutter/material.dart';
import 'package:minimal_app/core/widgets/shared/minimal_title.dart';

class MinimalButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MinimalButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => onPressed(),
      child: MinimalTitle(
        text: text,
        style: Theme.of(context).textTheme.labelLarge!,
      ),
    );
  }
}
