import 'package:tots_core/tots_core.dart';

import '../helpers/api_base_response.dart';

class AuthHttp {
  static Future<ApiBaseResponse> login(String email, String password) async {
    return await TotsHttp.post(
      '/mia-auth/login',
      {
        'email': email,
        'password': password,
      },
      (data) => ApiBaseResponse.fromMap(data),
    );
  }
}
