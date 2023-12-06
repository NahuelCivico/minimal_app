part of 'customer_cubit.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerStateLoading extends CustomerState {}

class CustomerStateLoaded extends CustomerState {
  final List<CustomerModel> customers;

  const CustomerStateLoaded(this.customers);

  @override
  List<Object> get props => [customers];
}

class CustomerStateSelected extends CustomerState {
  final CustomerModel customer;

  const CustomerStateSelected(this.customer);

  @override
  List<Object> get props => [customer];
}

class CustomerStateError extends CustomerState {
  final String message;

  const CustomerStateError(this.message);

  @override
  List<Object> get props => [message];
}
