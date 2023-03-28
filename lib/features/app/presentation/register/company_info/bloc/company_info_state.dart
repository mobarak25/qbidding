part of 'company_info_bloc.dart';

class CompanyInfoState extends Equatable {
  const CompanyInfoState({
    this.forms = Forms.initial,
    this.companyName = '',
    this.companyAddress = '',
    this.images = const [],
  });
  final Forms forms;
  final String companyName;
  final String companyAddress;
  final List<ImageFile> images;

  CompanyInfoState copyWith({
    Forms? forms,
    String? companyName,
    String? companyAddress,
    List<ImageFile>? images,
  }) {
    return CompanyInfoState(
      forms: forms ?? this.forms,
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
      images: images ?? this.images,
    );
  }

  @override
  List<Object> get props => [forms, companyName, companyAddress, images];
}

class CompanyInfoInitial extends CompanyInfoState {}
