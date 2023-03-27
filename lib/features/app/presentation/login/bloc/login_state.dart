part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.forms = Forms.initial,
    this.loading = false,
    this.mobile = '',
    this.password = '',
    this.isObscureText = true,
  });
  final Forms forms;
  final bool loading;
  final String mobile, password;
  final bool isObscureText;

  LoginState copyWith({
    Forms? forms,
    bool? loading,
    String? mobile,
    String? password,
    bool? isObscureText,
  }) {
    return LoginState(
        forms: forms ?? this.forms,
        loading: loading ?? this.loading,
        mobile: mobile ?? this.mobile,
        password: password ?? this.password,
        isObscureText: isObscureText ?? this.isObscureText);
  }

  @override
  List<Object> get props => [forms, loading, mobile, password, isObscureText];
}

class LoginInitial extends LoginState {}
