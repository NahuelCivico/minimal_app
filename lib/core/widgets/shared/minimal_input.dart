import 'package:flutter/material.dart';

import '../../design/minimal_colors.dart';

class MinimalInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String errorEmptyText;
  final bool isInputPassword;

  const MinimalInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.errorEmptyText,
    this.isInputPassword = false,
  }) : super(key: key);

  @override
  State<MinimalInput> createState() => _MinimalInputState();
}

class _MinimalInputState extends State<MinimalInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.displayMedium,
      controller: widget.textEditingController,
      keyboardType: TextInputType.emailAddress,
      obscureText: widget.isInputPassword ? !_passwordVisible : false,
      decoration: InputDecoration(
        counterText: '',
        hintText: widget.hintText,
        filled: true,
        fillColor: MinimalColors.transparent,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        suffixIcon: widget.isInputPassword
            ? IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                color: MinimalColors.lightGrey,
              )
            : null,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MinimalColors.lightGrey,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MinimalColors.lightGrey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MinimalColors.lightGrey,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MinimalColors.red,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MinimalColors.red,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return value!.trim().isEmpty
            ? 'Ingresa un ${widget.errorEmptyText}'
            : null;
      },
    );
  }
}
