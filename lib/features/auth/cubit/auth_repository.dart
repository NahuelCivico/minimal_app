import 'package:dartz/dartz.dart';
import 'package:minimal_app/core/helpers/storage_preferences.dart';
import 'package:minimal_app/core/models/user_model.dart';

import '../../../core/helpers/failure.dart';
import '../../../core/https/auth_http.dart';

class AuthRepository {
  UserModel currentUser = UserModel.empty();

  Future<Either<Failure, UserModel>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await AuthHttp.login(email, password);
    if (response.isSuccessful) {
      currentUser = UserModel.fromMap(response.data);
      await StoragePreferences.saveAccessToken(
        accessToken: currentUser.accessToken,
      );
      return Right(currentUser);
    } else {
      return Left(ServerFailure(response.message));
    }
  }
}
