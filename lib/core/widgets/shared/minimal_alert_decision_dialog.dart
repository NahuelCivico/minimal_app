import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/core/widgets/shared/minimal_title.dart';
import 'package:minimal_app/features/customers/cubit/customer_cubit.dart';

import '../../design/minimal_colors.dart';
import 'minimal_button.dart';

class MinimalAlertDecisionDialog extends StatelessWidget {
  final int customerId;

  const MinimalAlertDecisionDialog({
    Key? key,
    required this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MinimalColors.white,
      contentPadding: const EdgeInsets.only(
        top: 25,
        bottom: 50,
        left: 25,
        right: 25,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: MinimalColors.black,
            size: 100,
          ),
          const SizedBox(height: 20),
          MinimalTitle(
            text: MinimalConstants.questionDeleteCliente,
            style: Theme.of(context).textTheme.titleMedium!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            TextButton(
              child: const Text(MinimalConstants.ok),
              onPressed: () {
                context.read<CustomerCubit>().deleteCustomer(customerId);
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MinimalButton(
                text: MinimalConstants.cancel,
                onPressed: () {
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
