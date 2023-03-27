part of 'register_first_bloc.dart';

class RegisterFirstState extends Equatable {
  const RegisterFirstState({
    this.forms = Forms.initial,
  });

  final Forms forms;

  RegisterFirstState copyWith({
    Forms? forms,
  }) {
    return RegisterFirstState(
      forms: forms ?? this.forms,
    );
  }

  @override
  List<Object> get props => [forms];
}

class RegisterFirstInitial extends RegisterFirstState {}
