import 'dart:async';

import 'package:clean_arch_cubit/domain/repo/auth_repo.dart';
import 'package:clean_arch_cubit/domain/usecase/app/app_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// We have two technique to create state
/// One displayed in Splash as a enum classes
/// Second displayed in Login and Home with dedicated classes.
enum SplashState { initial, moveToLogin, moveToHome }

class SplashCubit extends Cubit<SplashState> {
  late Timer? _timer;

  final _repo = getIt<AuthRepo>();

  SplashCubit() : super(SplashState.initial) {
    startTimer();
  }

  @override
  Future<void> close() {
    if (_timer != null) _timer!.cancel();
    return super.close();
  }

  void startTimer() {
    _timer = Timer(const Duration(seconds: 3), () async {
      String token = await _repo.getToken();
      debugPrint("token : $token");
      if (token.isEmpty) {
        emit(SplashState.moveToLogin);
      } else {
        emit(SplashState.moveToHome);
      }
    });
  }
}
