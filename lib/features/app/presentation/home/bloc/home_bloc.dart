import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/features/app/data/data_sources/remote_constants.dart';
import 'package:qbidding/features/app/domain/entities/default_response.dart';
import 'package:qbidding/features/app/domain/repositories/api_repo.dart';
import 'package:qbidding/features/app/domain/repositories/local_storage_repo.dart';
import 'package:qbidding/features/app/presentation/login/view/login_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._apiRepo, this._localStorageRepo, this._iFlutterNavigator)
      : super(HomeInitial()) {
    on<LogOut>(_logOut);
  }

  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;
  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _logOut(LogOut event, Emitter<HomeState> emit) async {
    final logoutResponse = await _apiRepo.post(
        endpoint: logoutEndpoint, responseModel: const DefaultResponse());
    if (logoutResponse != null) {
      _localStorageRepo.removeAll();
      _iFlutterNavigator.pushReplacement(LoginScreen.route());
    }
  }
}
