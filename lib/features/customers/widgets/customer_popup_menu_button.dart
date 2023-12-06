import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_app/features/customers/cubit/customer_cubit.dart';

import '../../../core/helpers/minimal_constants.dart';
import '../../../core/widgets/shared/minimal_alert_decision_dialog.dart';
import '../../../core/widgets/shared/minimal_alert_dialog.dart';
import '../../../core/widgets/shared/minimal_title.dart';

class CustomerPopupMenuButton extends StatelessWidget {
  final int customerId;

  const CustomerPopupMenuButton({
    Key? key,
    required this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          child: Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(width: 5),
              MinimalTitle(
                text: MinimalConstants.edit,
                style: Theme.of(context).textTheme.labelSmall!,
              ),
            ],
          ),
          onTap: () {
            context.read<CustomerCubit>().selectCustomer(customerId);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const MinimalAlertDialog(
                  isEditing: true,
                  title: MinimalConstants.editClient,
                );
              },
            );
          },
        ),
        PopupMenuItem<String>(
          child: Row(
            children: [
              const Icon(Icons.delete),
              const SizedBox(width: 5),
              MinimalTitle(
                text: MinimalConstants.delete,
                style: Theme.of(context).textTheme.labelSmall!,
              ),
            ],
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return MinimalAlertDecisionDialog(customerId: customerId);
              },
            );
          },
        ),
      ],
    );
  }
}
