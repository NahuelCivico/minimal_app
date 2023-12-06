// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minimal_app/core/design/minimal_colors.dart';
import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/core/widgets/shared/minimal_button.dart';
import 'package:minimal_app/core/widgets/shared/minimal_input.dart';
import 'package:minimal_app/core/widgets/shared/minimal_title.dart';
import 'package:minimal_app/features/customers/cubit/customer_cubit.dart';

import '../../models/customer_model.dart';

class MinimalAlertDialog extends StatelessWidget {
  final bool isEditing;
  final String title;

  const MinimalAlertDialog({
    Key? key,
    this.isEditing = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final costumerToEdit = context.read<CustomerCubit>().getSelectedCustomer();
    final TextEditingController firstNameController = TextEditingController(
        text: isEditing ? costumerToEdit?.firstName ?? '' : '');
    final TextEditingController lastNameController = TextEditingController(
        text: isEditing ? costumerToEdit?.lastName ?? '' : '');
    final TextEditingController emailController = TextEditingController(
        text: isEditing ? costumerToEdit?.email ?? '' : '');

    return AlertDialog(
      backgroundColor: MinimalColors.white,
      title: MinimalTitle(
        text: title,
        style: Theme.of(context).textTheme.titleMedium!,
      ),
      contentPadding: const EdgeInsets.only(
        top: 25,
        bottom: 50,
        left: 25,
        right: 25,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MinimalColors.white,
              border: Border.all(
                color: MinimalColors.lima,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: MinimalColors.white,
              radius: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MinimalConstants.emptyAvatarImage),
                  const SizedBox(height: 10),
                  MinimalTitle(
                    text: MinimalConstants.uploadImage,
                    style: Theme.of(context).textTheme.headlineMedium!,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          MinimalInput(
            textEditingController: firstNameController,
            hintText: MinimalConstants.firstName,
            errorEmptyText: MinimalConstants.nombreError,
          ),
          const SizedBox(height: 20),
          MinimalInput(
            textEditingController: lastNameController,
            hintText: MinimalConstants.lastName,
            errorEmptyText: MinimalConstants.apellidoError,
          ),
          const SizedBox(height: 20),
          MinimalInput(
            textEditingController: emailController,
            hintText: MinimalConstants.emailAddress,
            errorEmptyText: MinimalConstants.emailError,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            TextButton(
              child: const Text(MinimalConstants.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MinimalButton(
                text: MinimalConstants.save,
                onPressed: () {
                  context.read<CustomerCubit>().save(
                        customerModel: CustomerModel(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          photo: '',
                        ),
                        isEditing: isEditing,
                      );
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
