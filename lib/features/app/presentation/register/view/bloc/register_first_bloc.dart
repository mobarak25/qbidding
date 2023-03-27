import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/enums.dart';

part 'register_first_event.dart';
part 'register_first_state.dart';

class RegisterFirstBloc extends Bloc<RegisterFirstEvent, RegisterFirstState> {
  RegisterFirstBloc(this._iFlutterNavigator) : super(RegisterFirstInitial()) {
    on<PressToContinue>(_pressToContinue);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _pressToContinue(
      PressToContinue event, Emitter<RegisterFirstState> emit) {}
}
