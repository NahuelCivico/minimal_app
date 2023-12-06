import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minimal_app/core/design/minimal_colors.dart';
import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/features/customers/cubit/customer_cubit.dart';

class MinimalInputSearch extends StatelessWidget {
  final TextEditingController textEditingController;

  const MinimalInputSearch({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: MinimalColors.black,
        fontSize: 14,
      ),
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        counterText: '',
        prefixIcon: Icon(
          Icons.search,
          color: MinimalColors.lightGrey,
        ),
        hintText: MinimalConstants.searh,
        filled: true,
        fillColor: MinimalColors.transparent,
        hintStyle: TextStyle(
          color: MinimalColors.black,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: MinimalColors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: MinimalColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: MinimalColors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: MinimalColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: MinimalColors.red,
          ),
        ),
      ),
      onChanged: (value) {
        context.read<CustomerCubit>().searchCustomers(query: value);
      },
    );
  }
}
