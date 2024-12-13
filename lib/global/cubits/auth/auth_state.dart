part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  final AuthModel auth;
  const AuthState(this.auth);

  @override
  List<Object> get props => [auth];
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.auth);
}

final class AuthRefreshLoading extends AuthState {
  const AuthRefreshLoading(super.auth);
}

final class AuthLoading extends AuthState {
  const AuthLoading(super.auth);
}


final class AuthSuccess extends AuthState {
  const AuthSuccess(super.auth);
}

final class AuthLoggedOut extends AuthState {
  const AuthLoggedOut(super.auth);
}

final class AuthFailed extends AuthState {
  final String message;

  const AuthFailed(super.auth, {required this.message});

  @override
  List<Object> get props => [message];
}
