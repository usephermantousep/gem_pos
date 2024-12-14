import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gempos/core/util/util.dart';
import 'package:gempos/global/models.dart';
import 'package:gempos/global/services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._service) : super(AuthInitial(AuthModel.init()));

  final AuthService _service;

  Future<void> login(LoginModel login) async {
    emit(AuthLoading(state.auth));
    final response = await _service.login(data: login);

    if (response.value == null) {
      emit(AuthFailed(state.auth, message: response.message ?? 'Error'));
      return;
    }

    log('token : ${response.value}');

    SharedPreferencesUtil.setString(key: SharedPreferencesKey.token, value: response.value!);

    getUser();
  }

  Future<void> logout() async {
    SharedPreferencesUtil.remove(key: SharedPreferencesKey.token);
    await _service.logout();
  }

  Future<void> checkToken() async {
    final token = await SharedPreferencesUtil.getString(key: SharedPreferencesKey.token);

    if (token?.isEmpty ?? true) {
      emit(AuthFailed(state.auth, message: ''));
      return;
    }

    getUser();
  }

  Future<void> getUser() async {
    emit(AuthRefreshLoading(state.auth));
    final response = await _service.getUser();

    if (response.value == null) {
      if (response.statusCode == 401) SharedPreferencesUtil.remove(key: SharedPreferencesKey.token);
      emit(AuthFailed(state.auth, message: response.message ?? 'error'));
      return;
    }
    emit(AuthSuccess(state.auth.copyWith(user: response.value)));
  }
}
