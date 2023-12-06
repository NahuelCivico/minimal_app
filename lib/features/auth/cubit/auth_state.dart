part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthStateUnknown extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateAuthenticated extends AuthState {
  final UserModel userModel;

  const AuthStateAuthenticated(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class AuthStateUnauthenticated extends AuthState {
  final String message;

  const AuthStateUnauthenticated(this.message);

  @override
  List<Object> get props => [message];
}
