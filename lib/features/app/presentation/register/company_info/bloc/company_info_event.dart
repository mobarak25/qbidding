part of 'company_info_bloc.dart';

abstract class CompanyInfoEvent extends Equatable {
  const CompanyInfoEvent();

  @override
  List<Object> get props => [];
}

class ChangeCompanyName extends CompanyInfoEvent {
  const ChangeCompanyName({required this.companyName});
  final String companyName;
}

class ChangeCompanyAddress extends CompanyInfoEvent {
  const ChangeCompanyAddress({required this.companyAddress});
  final String companyAddress;
}

class PressToContinue extends CompanyInfoEvent {
  const PressToContinue(
      {required this.companyNameFocusNode,
      required this.companyAddressFocusNode});
  final FocusNode companyNameFocusNode;
  final FocusNode companyAddressFocusNode;
}

class PickImage extends CompanyInfoEvent {}
