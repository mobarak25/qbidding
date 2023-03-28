part of 'register_bloc.dart';

class PersonalInfoState extends Equatable {
  const PersonalInfoState({
    this.forms = Forms.initial,
    this.name = '',
    this.mobile = '',
    this.email = '',
    this.password = '',
    this.images = const [],
  });
  final Forms forms;
  final String name, mobile, email, password;
  final List<ImageFile> images;

  PersonalInfoState copyWith({
    Forms? forms,
    String? name,
    String? mobile,
    String? email,
    String? password,
    List<ImageFile>? images,
  }) {
    return PersonalInfoState(
      forms: forms ?? this.forms,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      password: password ?? this.password,
      images: images ?? this.images,
    );
  }

  @override
  List<Object> get props => [forms, name, mobile, email, password, images];
}

class RegisterInitial extends PersonalInfoState {}
