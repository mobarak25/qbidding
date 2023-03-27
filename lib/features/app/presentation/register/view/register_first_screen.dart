import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/widget/big_camera.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/button.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/core/widget/text_field.dart';

import 'bloc/register_first_bloc.dart';

class RegisterFirstScreen extends StatelessWidget {
  RegisterFirstScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => RegisterFirstScreen(),
      );

  final mobileFocusnode = FocusNode();
  final passwordFocusnode = FocusNode();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFirstBloc(getIt<IFlutterNavigator>()),
      child: BlocBuilder<RegisterFirstBloc, RegisterFirstState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final bloc = context.read<RegisterFirstBloc>();

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
                    focusNode: mobileFocusnode,
                    suffixIcon: const Icon(Icons.person),
                    onChanged: (String mobile) {
                      //bloc.add(ChangeMobile(mobile: mobile));
                    },
                    labelText: "Your Name",
                    controller: mobileController,
                    // errorText:
                    //     state.forms == Forms.invalid && state.mobile.isEmpty
                    //         ? 'Enter your mobile number'
                    //         : '',
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: passwordFocusnode,
                    controller: passwordController,
                    onChanged: (String password) {
                      //bloc.add(ChangePassword(password: password));
                    },
                    suffixIcon: const Icon(Icons.settings_phone),
                    labelText: "Mobile",
                    // errorText:
                    //     state.forms == Forms.invalid && state.password.isEmpty
                    //         ? 'Enter your password'
                    //         : '',
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: passwordFocusnode,
                    controller: passwordController,
                    onChanged: (String password) {
                      //bloc.add(ChangePassword(password: password));
                    },
                    suffixIcon: const Icon(Icons.mail),
                    labelText: "Email",
                    // errorText:
                    //     state.forms == Forms.invalid && state.password.isEmpty
                    //         ? 'Enter your password'
                    //         : '',
                  ),
                  const SizedBox(height: 25),
                  BigCamera(
                    press: () {},
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: passwordFocusnode,
                    controller: passwordController,
                    onChanged: (String password) {
                      //bloc.add(ChangePassword(password: password));
                    },
                    obscureText: true,
                    suffixIcon: const Icon(Icons.visibility_off),
                    labelText: "Password",
                    // errorText:
                    //     state.forms == Forms.invalid && state.password.isEmpty
                    //         ? 'Enter your password'
                    //         : '',
                  ),
                  const SizedBox(height: 30),
                  ButtonB(
                    heigh: 55,
                    text: "Continue",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: bWhite,
                    press: () {
                      // bloc.add(PressToLogIn(
                      //   mobileFocus: mobileFocusnode,
                      //   passwordFocus: passwordFocusnode,
                      // ));
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextB(text: "Already have an account?"),
                      InkWell(
                          onTap: () {},
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
