import 'package:dartz/dartz.dart';
import 'package:minimal_app/core/https/customer_http.dart';
import 'package:minimal_app/core/models/customer_model.dart';
import 'package:minimal_app/features/auth/cubit/auth_repository.dart';

import '../../../core/helpers/failure.dart';

class CustomerRepository {
  AuthRepository authRepository;
  int page = 1;
  List<CustomerModel> customers = [];
  List<CustomerModel> customersFiltered = [];

  CustomerRepository({
    required this.authRepository,
  });

  Future<List<CustomerModel>> searchCustomers({required String query}) async {
    if (query.isEmpty) {
      return customers;
    }

    customersFiltered = customers
        .where((element) =>
            element.firstName.toLowerCase().contains(query.toLowerCase()) ||
            element.lastName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return customersFiltered;
  }

  Future<Either<Failure, List<CustomerModel>>> getAllCustomers() async {
    final response = await CustomerHttp.getAllCustomers(page: page);
    page++;
    if (response.isSuccessful) {
      for (final customer in response.data) {
        customers.add(CustomerModel.fromMap(customer));
      }
      return Right(customers);
    } else {
      return Left(ServerFailure(response.message));
    }
  }

  Future<Either<Failure, CustomerModel>> save(
      {required CustomerModel customerModel}) async {
    final response = await CustomerHttp.save(customerModel);
    if (response.isSuccessful) {
      final newCustomer = CustomerModel.fromMap(response.data);
      customers.removeWhere((element) => element.id == newCustomer.id);
      customers.insert(0, newCustomer);
      return Right(newCustomer);
    } else {
      return Left(ServerFailure(response.message));
    }
  }

  Future<Either<Failure, bool>> deleteCustomer(
      {required int customerId}) async {
    final response = await CustomerHttp.deleteCustomer(customerId);
    if (response.isSuccessful) {
      customers.removeWhere((element) => element.id == customerId);
      return const Right(true);
    } else {
      return Left(ServerFailure(response.message));
    }
  }
}
