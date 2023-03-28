import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qbidding/core/form_validator/validator.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/utils/utilities.dart';

part 'company_info_event.dart';
part 'company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  CompanyInfoBloc(this._iFlutterNavigator, this._imagePicker)
      : super(CompanyInfoInitial()) {
    on<ChangeCompanyName>(_changeCompanyName);
    on<ChangeCompanyAddress>(_changeCompanyAddress);
    on<PickImage>(_pickImage);
    on<PressToContinue>(_pressToContinue);
  }
  final IFlutterNavigator _iFlutterNavigator;
  final ImagePicker _imagePicker;

  FutureOr<void> _changeCompanyName(
      ChangeCompanyName event, Emitter<CompanyInfoState> emit) {
    emit(state.copyWith(companyName: event.companyName));
  }

  FutureOr<void> _changeCompanyAddress(
      ChangeCompanyAddress event, Emitter<CompanyInfoState> emit) {
    emit(state.copyWith(companyAddress: event.companyAddress));
  }

  FutureOr<void> _pickImage(
      PickImage event, Emitter<CompanyInfoState> emit) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);
    if (file != null) {
      emit(state.copyWith(
          images: List.from(state.images)
            ..add(ImageFile(name: 'images[]', file: file))));
    }
    print(state.images);
  }

  FutureOr<void> _pressToContinue(
      PressToContinue event, Emitter<CompanyInfoState> emit) {
    if (isValid(event)) {
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  bool isValid(PressToContinue event) {
    final validate = Validator.isValidated(items: [
      FormItem(text: state.companyName, focusNode: event.companyNameFocusNode),
      FormItem(
          text: state.companyAddress, focusNode: event.companyAddressFocusNode),
    ], navigator: _iFlutterNavigator);

    if (!validate) return false;
    if (state.companyName.isEmpty ||
        state.companyAddress.isEmpty ||
        state.images.isEmpty) {
      return false;
    }

    return true;
  }
}
