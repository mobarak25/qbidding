import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/features/app/data/data_sources/local_keys.dart';
import 'package:qbidding/features/app/domain/repositories/local_storage_repo.dart';
import 'package:qbidding/features/app/presentation/home/view/home_screen.dart';
import 'package:qbidding/features/app/presentation/login/view/login_screen.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._iFlutterNavigator, this._localStorageRepo)
      : super(SplashInitial()) {
    on<CheckLogedIn>(_checkLogedIn);

    add(CheckLogedIn());
  }

  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _checkLogedIn(CheckLogedIn event, Emitter<SplashState> emit) {
    Timer(const Duration(seconds: 2), () {
      if (_localStorageRepo.read(key: tokenDB) != null) {
        _iFlutterNavigator.pushReplacement(HomeScreen.route());
      } else {
        _iFlutterNavigator.pushReplacement(LoginScreen.route());
      }
    });
  }
}
