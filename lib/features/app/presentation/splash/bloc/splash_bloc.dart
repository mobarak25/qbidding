import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/features/app/presentation/login/view/login_screen.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._iFlutterNavigator) : super(SplashInitial()) {
    on<GoToLoginScreen>(_goToLoginScreen);

    add(GoToLoginScreen());
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _goToLoginScreen(
      GoToLoginScreen event, Emitter<SplashState> emit) {
    Timer(const Duration(seconds: 5), () {
      _iFlutterNavigator.pushReplacement(LoginScreen.route());
    });
  }
}
