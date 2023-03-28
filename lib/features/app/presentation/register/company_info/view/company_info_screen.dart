import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/widget/big_camera.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/button.dart';
import 'package:qbidding/core/widget/grid_view_file_image.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/core/widget/text_field.dart';
import 'package:qbidding/features/app/presentation/register/company_info/bloc/company_info_bloc.dart';

class CompanyInfoScreen extends StatelessWidget {
  CompanyInfoScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => CompanyInfoScreen(),
      );

  final companyNameFocusnode = FocusNode();
  final companyAddressFocusnode = FocusNode();

  final companyNameController = TextEditingController();
  final companyAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompanyInfoBloc(getIt<IFlutterNavigator>(), getIt<ImagePicker>()),
      child: BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final bloc = context.read<CompanyInfoBloc>();

          return Body(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 1,
                      child: const TextB(
                        text: "Your Company Information",
                        fontSize: 16,
                        fontColor: bDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      paddingHeight: 18,
                      focusNode: companyNameFocusnode,
                      controller: companyNameController,
                      suffixIcon: const Icon(Icons.leaderboard),
                      onChanged: (String name) {
                        bloc.add(ChangeCompanyName(companyName: name));
                      },
                      labelText: "Company Name",
                      errorText: state.forms == Forms.invalid &&
                              state.companyName.isEmpty
                          ? 'Enter Company name'
                          : '',
                    ),
                    const SizedBox(height: 25),
                    TextFieldB(
                      paddingHeight: 18,
                      focusNode: companyAddressFocusnode,
                      controller: companyAddressController,
                      maxLines: 3,
                      onChanged: (String address) {
                        bloc.add(ChangeCompanyAddress(companyAddress: address));
                      },
                      labelText: "Your company address",
                      errorText: state.forms == Forms.invalid &&
                              state.companyAddress.isEmpty
                          ? 'Enter company address'
                          : '',
                    ),
                    const SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigCamera(
                          tittle: "Upload Trade license",
                          subtitle: "Upload company trade license",
                          press: () {
                            bloc.add(PickImage());
                          },
                        ),
                        TextB(
                          text: state.forms == Forms.invalid &&
                                  state.images.isEmpty
                              ? 'Please upload trade licence'
                              : '',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontColor: bRed,
                        ),
                      ],
                    ),
                    GridViewFileImageB(
                      padding: 0,
                      crossAxisCount: 5,
                      images: state.images,
                    ),
                    const SizedBox(height: 25),
                    ButtonB(
                      heigh: 55,
                      text: "Continue",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: bWhite,
                      press: () {
                        bloc.add(PressToContinue(
                            companyNameFocusNode: companyNameFocusnode,
                            companyAddressFocusNode: companyAddressFocusnode));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
