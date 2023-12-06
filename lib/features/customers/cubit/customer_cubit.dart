import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_app/features/customers/cubit/customer_repository.dart';

import '../../../core/models/customer_model.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerModel? _customer;
  CustomerRepository customerRepository;

  CustomerCubit({
    required this.customerRepository,
  }) : super(CustomerStateLoading()) {
    getAllCustomers();
  }

  Future<List<CustomerModel>> searchCustomers({required String query}) async {
    emit(CustomerStateLoading());
    final response = await customerRepository.searchCustomers(query: query);
    emit(CustomerStateLoaded(response));
    return response;
  }

  Future<void> getAllCustomers() async {
    emit(CustomerStateLoading());
    final response = await customerRepository.getAllCustomers();
    response.fold(
      (failure) => emit(CustomerStateError(failure.message)),
      (userModel) => emit(CustomerStateLoaded(userModel)),
    );
  }

  Future<void> save(
      {required CustomerModel customerModel, required bool isEditing}) async {
    emit(CustomerStateLoading());
    isEditing
        ? customerModel = customerModel.copyWith(id: _customer!.id)
        : customerModel;
    final response = await customerRepository.save(
      customerModel: customerModel,
    );
    response.fold(
      (failure) => emit(CustomerStateError(failure.message)),
      (userModel) => emit(CustomerStateLoaded(customerRepository.customers)),
    );
  }

  Future<void> deleteCustomer(int customerId) async {
    emit(CustomerStateLoading());
    await customerRepository.deleteCustomer(customerId: customerId);
    emit(CustomerStateLoaded(customerRepository.customers));
  }

  void selectCustomer(int customerId) {
    _customer = customerRepository.customers.firstWhere(
      (element) => element.id == customerId,
    );
  }

  CustomerModel? getSelectedCustomer() {
    return _customer;
  }
}
