import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
}
