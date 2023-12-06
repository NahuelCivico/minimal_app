import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/user_model.dart';
import 'auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({
    required this.authRepository,
  }) : super(AuthStateUnknown()) {
    // autoLogin();
  }

  // Future<void> autoLogin() async {
  //   emit(AuthStateLoading());
  //   var response = await authRepository.autoLogin();
  //   response.fold(
  //     (failure) => emit(AuthStateUnknown()),
  //     (authResponse) => emit(AuthStateAuthenticated(authResponse)),
  //   );
  // }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(AuthStateLoading());
    var response = await authRepository.loginWithEmailAndPassword(
        email: email, password: password);
    response.fold(
      (failure) => emit(AuthStateUnauthenticated(failure.message)),
      (userModel) => emit(AuthStateAuthenticated(userModel)),
    );
  }
}
