part of 'register_first_bloc.dart';

abstract class RegisterFirstEvent extends Equatable {
  const RegisterFirstEvent();

  @override
  List<Object> get props => [];
}

class PressToContinue extends RegisterFirstEvent {}
