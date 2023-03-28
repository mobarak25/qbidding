
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/widget/big_camera.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/button.dart';
import 'package:qbidding/core/widget/grid_view_file_image.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/core/widget/text_field.dart';
import 'package:qbidding/features/app/presentation/register/personal_info/bloc/register_bloc.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => PersonalInfoScreen(),
      );

  final nameFocusnode = FocusNode();
  final mobileFocusnode = FocusNode();
  final emailFocusnode = FocusNode();
  final passwordFocusnode = FocusNode();

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PersonalInfoBloc(getIt<IFlutterNavigator>(), getIt<ImagePicker>()),
      child: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final bloc = context.read<PersonalInfoBloc>();

          return Body(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(logoPng, width: size.width * 0.6),
                  const SizedBox(height: 20),
                  const TextB(
                    text:
                        "Please create an account so you manage\nyour all information and product",
                    fontSize: 16,
                    alignMent: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: size.width * 1,
                    child: const TextB(
                      text: "Your Personal  Information",
                      fontSize: 16,
                      fontColor: bDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: nameFocusnode,
                    controller: nameController,
                    suffixIcon: const Icon(Icons.person),
                    onChanged: (String name) {
                      bloc.add(ChangeName(name: name));
                    },
                    labelText: "Your Name",
                    errorText:
                        state.forms == Forms.invalid && state.name.isEmpty
                            ? 'Enter your name'
                            : '',
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: mobileFocusnode,
                    controller: mobileController,
                    onChanged: (String mobile) {
                      bloc.add(ChangeMobile(mobile: mobile));
                    },
                    suffixIcon: const Icon(Icons.settings_phone),
                    labelText: "Mobile",
                    errorText:
                        state.forms == Forms.invalid && state.mobile.isEmpty
                            ? 'Enter your mobile'
                            : '',
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: emailFocusnode,
                    controller: emailController,
                    onChanged: (String email) {
                      bloc.add(ChangeEmail(email: email));
                    },
                    suffixIcon: const Icon(Icons.mail),
                    labelText: "Email",
                    errorText:
                        state.forms == Forms.invalid && state.email.isEmpty
                            ? 'Enter your email'
                            : '',
                  ),
                  const SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigCamera(
                        tittle: "Upload NID",
                        subtitle: "Upload national identity card",
                        press: () {
                          bloc.add(PickImage());
                        },
                      ),
                      TextB(
                        text:
                            state.forms == Forms.invalid && state.images.isEmpty
                                ? 'Please upload NID'
                                : '',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontColor: bRed,
                      ),
                    ],
                  ),
                  GridViewFileImageB(
                    crossAxisCount: 5,
                    images: state.images,
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: passwordFocusnode,
                    controller: passwordController,
                    onChanged: (String password) {
                      bloc.add(ChangePassword(password: password));
                    },
                    obscureText: true,
                    suffixIcon: const Icon(Icons.visibility_off),
                    labelText: "Password",
                    errorText:
                        state.forms == Forms.invalid && state.password.isEmpty
                            ? 'Enter your password'
                            : '',
                  ),
                  const SizedBox(height: 30),
                  ButtonB(
                    heigh: 55,
                    text: "Continue",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: bWhite,
                    press: () {
                      bloc.add(PressToContinue(
                        nameFocusnode: nameFocusnode,
                        mobileFocus: mobileFocusnode,
                        emailFocusnode: emailFocusnode,
                        passwordFocus: passwordFocusnode,
                      ));
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextB(text: "Already have an account?"),
                      InkWell(
                          onTap: () {
                            bloc.add(GotoLoginScreen());
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextB(
                              text: "Log In",
                              fontColor: bLightBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
