import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gempos/global/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(LoginModel.init()));

  void update(LoginModel data) => emit(LoginInitial(data));

  toggleObscure() {
    emit(
      LoginInitial(
        state.loginModel.copyWith(
          obscure: !state.loginModel.obscure,
        ),
      ),
    );
  }
}
