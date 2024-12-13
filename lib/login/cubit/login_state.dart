part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  final LoginModel loginModel;
  const LoginState(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

final class LoginInitial extends LoginState {
  const LoginInitial(super.loginModel);
}

final class LoginLoading extends LoginState {
  const LoginLoading(super.loginModel);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess(super.loginModel);
}

final class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(super.loginModel, {required this.message});

  @override
  List<Object> get props => [message];
}
