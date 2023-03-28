import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qbidding/core/form_validator/validator.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/utils/utilities.dart';
import 'package:qbidding/features/app/presentation/login/view/login_screen.dart';
import 'package:qbidding/features/app/presentation/register/company_info/view/company_info_screen.dart';

part 'register_event.dart';
part 'register_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc(this._iFlutterNavigator, this._imagePicker)
      : super(RegisterInitial()) {
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
      ChangeName event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _changeMobile(
      ChangeMobile event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _changeEmail(
      ChangeEmail event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _changePassword(
      ChangePassword event, Emitter<PersonalInfoState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _pressToContinue(
      PressToContinue event, Emitter<PersonalInfoState> emit) {
    if (isValid(event)) {
      _iFlutterNavigator.push(CompanyInfoScreen.route());
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
      GotoLoginScreen event, Emitter<PersonalInfoState> emit) {
    _iFlutterNavigator.pushReplacement(LoginScreen.route());
  }

  FutureOr<void> _pickImage(
      PickImage event, Emitter<PersonalInfoState> emit) async {
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
