part of 'register_first_bloc.dart';

abstract class RegisterFirstEvent extends Equatable {
  const RegisterFirstEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends RegisterFirstEvent {
  const ChangeName({required this.name});
  final String name;
}

class ChangeMobile extends RegisterFirstEvent {
  const ChangeMobile({required this.mobile});
  final String mobile;
}

class ChangeEmail extends RegisterFirstEvent {
  const ChangeEmail({required this.email});
  final String email;
}

class ChangePassword extends RegisterFirstEvent {
  const ChangePassword({required this.password});
  final String password;
}

class PickImage extends RegisterFirstEvent {}

class PressToContinue extends RegisterFirstEvent {
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

class GotoLoginScreen extends RegisterFirstEvent {}
