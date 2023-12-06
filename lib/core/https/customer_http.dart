import 'package:minimal_app/core/models/customer_model.dart';
import 'package:tots_core/tots_core.dart';

import '../helpers/api_base_response.dart';

class CustomerHttp {
  static Future<ApiBaseResponse> getAllCustomers({required int page}) async {
    return await TotsHttp.post(
      '/client/list?limit=5&page=$page',
      {},
      (data) => ApiBaseResponse.fromMap(data),
    );
  }

  static Future<ApiBaseResponse> save(CustomerModel customerModel) async {
    return await TotsHttp.post(
      '/client/save',
      customerModel.toMap(),
      (data) => ApiBaseResponse.fromMap(data),
    );
  }

  static Future<ApiBaseResponse> deleteCustomer(int customerId) async {
    return await TotsHttp.delete(
      '/client/remove/$customerId',
      (data) => ApiBaseResponse.fromMap(data),
    );
  }
}
