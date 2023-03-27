import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/form_validator/validator.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/features/app/presentation/register/view/register_first_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._iFlutterNavigator) : super(LoginInitial()) {
    on<ChangeMobile>(_changeMobile);
    on<ChangePassword>(_changePassword);
    on<GoToRegisterFirstScreen>(_goToRegisterFirstScreen);
    on<IsObscureText>(_isObscureText);
    on<PressToLogIn>(_pressToLogIn);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _changeMobile(ChangeMobile event, Emitter<LoginState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _changePassword(
      ChangePassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _pressToLogIn(PressToLogIn event, Emitter<LoginState> emit) {
    if (isValid(event)) {
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  FutureOr<void> _goToRegisterFirstScreen(
      GoToRegisterFirstScreen event, Emitter<LoginState> emit) {
    _iFlutterNavigator.push(RegisterFirstScreen.route());
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
