part of 'register_bloc.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends PersonalInfoEvent {
  const ChangeName({required this.name});
  final String name;
}

class ChangeMobile extends PersonalInfoEvent {
  const ChangeMobile({required this.mobile});
  final String mobile;
}

class ChangeEmail extends PersonalInfoEvent {
  const ChangeEmail({required this.email});
  final String email;
}

class ChangePassword extends PersonalInfoEvent {
  const ChangePassword({required this.password});
  final String password;
}

class PickImage extends PersonalInfoEvent {}

class PressToContinue extends PersonalInfoEvent {
  const PressToContinue(
      {required this.nameFocusnode,
      required this.mobileFocus,
      required this.emailFocusnode,
      required this.passwordFocus});
  final FocusNode nameFocusnode;
  final FocusNode mobileFocus;
  final FocusNode emailFocusnode;
  final FocusNode passwordFocus;
}

class GotoLoginScreen extends PersonalInfoEvent {}
