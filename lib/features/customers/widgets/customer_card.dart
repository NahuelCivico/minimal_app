// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/core/models/customer_model.dart';
import 'package:minimal_app/features/customers/widgets/customer_popup_menu_button.dart';

import '../../../core/design/minimal_colors.dart';
import '../../../core/widgets/shared/minimal_title.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customerModel;

  const CustomerCard({
    Key? key,
    required this.customerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MinimalColors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: MinimalColors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: customerModel.photo != ''
              ? NetworkImage(customerModel.photo)
              : const NetworkImage(MinimalConstants.imagePlaceholder),
        ),
        title: MinimalTitle(
          text: '${customerModel.firstName} ${customerModel.lastName}',
          style: Theme.of(context).textTheme.labelSmall!,
        ),
        subtitle: MinimalTitle(
          text: customerModel.email,
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
        trailing: CustomerPopupMenuButton(
          customerId: customerModel.id ?? 0,
        ),
      ),
    );
  }
}
