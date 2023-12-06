import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_app/core/helpers/minimal_constants.dart';
import 'package:minimal_app/core/widgets/shared/minimal_input_search.dart';
import 'package:minimal_app/core/widgets/shared/minimal_title.dart';
import 'package:minimal_app/features/customers/widgets/customer_card.dart';
import '../../../core/widgets/shared/minimal_alert_dialog.dart';
import '../../../core/widgets/shared/minimal_button.dart';
import '../../../core/widgets/shared/minimal_logo_image.dart';
import '../cubit/customer_cubit.dart';
import '../widgets/customer_bubbles.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          const CustomerBubbles(),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MinimalLogoImage(size: 60),
                  const SizedBox(height: 20),
                  MinimalTitle(
                    text: MinimalConstants.clients,
                    style: Theme.of(context).textTheme.displayLarge!,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: MinimalInputSearch(
                          textEditingController: searchController,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: MinimalButton(
                          text: MinimalConstants.addNew,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const MinimalAlertDialog(
                                  title: MinimalConstants.addNewClient,
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<CustomerCubit, CustomerState>(
                      builder: (context, state) {
                        if (state is CustomerStateLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CustomerStateLoaded) {
                          final customers = state.customers;
                          if (customers.isEmpty) {
                            return Center(
                              child: MinimalTitle(
                                text: MinimalConstants.noCustomersFound,
                                style:
                                    Theme.of(context).textTheme.displayLarge!,
                              ),
                            );
                          }
                          return ListView.separated(
                            itemCount: customers.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            itemBuilder: (context, index) {
                              return CustomerCard(
                                customerModel: customers[index],
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  MinimalButton(
                    text: MinimalConstants.loadMore,
                    onPressed: () {
                      context.read<CustomerCubit>().getAllCustomers();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
