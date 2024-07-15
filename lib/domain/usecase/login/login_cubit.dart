import 'package:bloc/bloc.dart';
import 'package:clean_arch_cubit/config/network/resource.dart';
import 'package:clean_arch_cubit/config/network/status.dart';
import 'package:clean_arch_cubit/data/model/remote/auth/login_request.dart';
import 'package:clean_arch_cubit/domain/entities/login/login_data.dart';
import 'package:clean_arch_cubit/domain/repo/auth_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _authRepo = getIt<AuthRepo>();

  final TextEditingController _usernameController = TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController _passwordController = TextEditingController(text: 'cityslicka');

  final _loginData = LoginData();

  LoginData get getLoginData => _loginData;

  get usernameController => _usernameController;

  get passwordController => _passwordController;

  LoginCubit() : super(LoginState.initial()) {
    _loginData.setPassword(_passwordController.text).setUsername(_usernameController.text);
  }

  @override
  Future<void> close() {
    _usernameController.dispose();
    _passwordController.dispose();
    return super.close();
  }

  void onSubmit() {
    //emit(state.copyWith(usernameError: '', passwordError: ''));
    emit(state.copyWith(onUsernameErrorResource: Resource(message: "")));
    emit(state.copyWith(onPassErrorResource: Resource(message: "")));

    if (_loginData.getUserName.isEmpty) {
      emit(state.copyWith(onUsernameErrorResource: Resource(message: "Username is Empty")));
    } else if (_loginData.getPassword.isEmpty) {
      emit(state.copyWith(onPassErrorResource: Resource(message: "Password is Empty")));
    } else {
      _callLoginApi();
    }
  }

  Future<void> _callLoginApi() async {
    final data = LoginRequest(
      email: _loginData.getUserName,
      password: _loginData.getPassword,
    ).toJson();

    emit(state.copyWith(onApiResource: Resource(status: STATUS.LOADING)));
    try {
      final response = await _authRepo.postLogin(requestData: data);
      emit(state.copyWith(onApiResource: Resource(status: STATUS.SUCCESS)));
      if (response != null) {
        _authRepo.setToken(response.token ?? "");
        emit(state.copyWith(onMoveToHome: Resource()));
      }
    } catch (e) {
      emit(state.copyWith(onApiResource: Resource(status: STATUS.ERROR)));
    }
  }
}
