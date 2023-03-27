part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ChangeMobile extends LoginEvent {
  const ChangeMobile({required this.mobile});
  final String mobile;
}

class ChangePassword extends LoginEvent {
  const ChangePassword({required this.password});
  final String password;
}

class IsObscureText extends LoginEvent {}

class GoToRegisterFirstScreen extends LoginEvent {}

class PressToLogIn extends LoginEvent {
  const PressToLogIn({required this.mobileFocus, required this.passwordFocus});
  final FocusNode mobileFocus;
  final FocusNode passwordFocus;
}
