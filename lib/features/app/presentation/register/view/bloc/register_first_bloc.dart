import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qbidding/core/form_validator/validator.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/utils/utilities.dart';
import 'package:qbidding/features/app/presentation/login/view/login_screen.dart';

part 'register_first_event.dart';
part 'register_first_state.dart';

class RegisterFirstBloc extends Bloc<RegisterFirstEvent, RegisterFirstState> {
  RegisterFirstBloc(this._iFlutterNavigator, this._imagePicker)
      : super(RegisterFirstInitial()) {
    on<PressToContinue>(_pressToContinue);
    on<ChangeName>(_changeName);
    on<ChangeMobile>(_changeMobile);
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
    on<GotoLoginScreen>(_gotoLoginScreen);
    on<PickImage>(_pickImage);
  }

  final IFlutterNavigator _iFlutterNavigator;
  final ImagePicker _imagePicker;

  FutureOr<void> _changeName(
      ChangeName event, Emitter<RegisterFirstState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _changeMobile(
      ChangeMobile event, Emitter<RegisterFirstState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _changeEmail(
      ChangeEmail event, Emitter<RegisterFirstState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _changePassword(
      ChangePassword event, Emitter<RegisterFirstState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _pressToContinue(
      PressToContinue event, Emitter<RegisterFirstState> emit) {
    if (isValid(event)) {
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  bool isValid(PressToContinue event) {
    final validate = Validator.isValidated(items: [
      FormItem(text: state.name, focusNode: event.nameFocusnode),
      FormItem(text: state.mobile, focusNode: event.mobileFocus),
      FormItem(text: state.email, focusNode: event.emailFocusnode),
      FormItem(text: state.password, focusNode: event.passwordFocus),
    ], navigator: _iFlutterNavigator);

    if (!validate) return false;
    if (state.name.isEmpty ||
        state.mobile.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty ||
        state.images.isEmpty) {
      return false;
    }

    return true;
  }

  FutureOr<void> _gotoLoginScreen(
      GotoLoginScreen event, Emitter<RegisterFirstState> emit) {
    _iFlutterNavigator.pushReplacement(LoginScreen.route());
  }

  FutureOr<void> _pickImage(
      PickImage event, Emitter<RegisterFirstState> emit) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);
    if (file != null) {
      emit(state.copyWith(
          images: List.from(state.images)
            ..add(ImageFile(name: 'images[]', file: file))));
    }
    print(state.images);
  }
}
