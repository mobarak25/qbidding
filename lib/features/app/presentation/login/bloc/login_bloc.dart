import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/form_validator/validator.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/features/app/data/data_sources/local_keys.dart';
import 'package:qbidding/features/app/data/data_sources/remote_constants.dart';
import 'package:qbidding/features/app/data/models/log_in.dart';
import 'package:qbidding/features/app/domain/entities/login_response.dart';
import 'package:qbidding/features/app/domain/repositories/api_repo.dart';
import 'package:qbidding/features/app/domain/repositories/local_storage_repo.dart';
import 'package:qbidding/features/app/presentation/home/view/home_screen.dart';
import 'package:qbidding/features/app/presentation/register/personal_info/view/personal_info_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._iFlutterNavigator, this._apiRepo, this._localStorageRepo)
      : super(LoginInitial()) {
    on<ChangeMobile>(_changeMobile);
    on<ChangePassword>(_changePassword);
    on<GoToRegisterFirstScreen>(_goToRegisterFirstScreen);
    on<IsObscureText>(_isObscureText);
    on<PressToLogIn>(_pressToLogIn);
  }

  final IFlutterNavigator _iFlutterNavigator;
  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _changeMobile(ChangeMobile event, Emitter<LoginState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _changePassword(
      ChangePassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _pressToLogIn(
      PressToLogIn event, Emitter<LoginState> emit) async {
    if (isValid(event) && !state.loading) {
      emit(state.copyWith(loading: true));
      final loginResponse = await _apiRepo.post(
        endpoint: loginEndpoint,
        body: LogIn(
            mobile: state.mobile,
            password: state.password,
            deviceName: 'Android'),
        token: '',
        responseModel: const LogInResponse(),
      );
      if (loginResponse != null) {
        _localStorageRepo.write(key: tokenDB, value: loginResponse.token!);

        _localStorageRepo.writeModel(
            key: loginResponseDB, value: loginResponse);

        _iFlutterNavigator.pushReplacement(HomeScreen.route());
      }
      emit(state.copyWith(loading: false));
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  FutureOr<void> _goToRegisterFirstScreen(
      GoToRegisterFirstScreen event, Emitter<LoginState> emit) {
    _iFlutterNavigator.push(PersonalInfoScreen.route());
  }

  FutureOr<void> _isObscureText(IsObscureText event, Emitter<LoginState> emit) {
    emit(state.copyWith(isObscureText: !state.isObscureText));
  }

  bool isValid(PressToLogIn event) {
    final validate = Validator.isValidated(items: [
      FormItem(text: state.mobile, focusNode: event.mobileFocus),
      FormItem(text: state.password, focusNode: event.passwordFocus),
    ], navigator: _iFlutterNavigator);

    if (!validate) return false;
    if (state.mobile.isEmpty || state.password.isEmpty) {
      return false;
    }

    return true;
  }
}
