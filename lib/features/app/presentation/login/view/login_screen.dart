import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/utils/enums.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/button.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/core/widget/text_field.dart';
import 'package:qbidding/features/app/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => LoginScreen(),
      );
  final mobileFocusnode = FocusNode();
  final passwordFocusnode = FocusNode();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(getIt<IFlutterNavigator>()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final bloc = context.read<LoginBloc>();

          return Body(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  Image.asset(logoPng, width: size.width * 0.6),
                  const SizedBox(height: 25),
                  const TextB(
                    text: "Please enter your mobile\nnumber and password",
                    fontSize: 20,
                    alignMent: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.1),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: mobileFocusnode,
                    textInputType: TextInputType.number,
                    onChanged: (String mobile) {
                      bloc.add(ChangeMobile(mobile: mobile));
                    },
                    labelText: "Mobile Number",
                    controller: mobileController,
                    suffixIcon: const Icon(
                      Icons.settings_phone,
                      color: bGray,
                    ),
                    errorText:
                        state.forms == Forms.invalid && state.mobile.isEmpty
                            ? 'Enter your mobile number'
                            : '',
                  ),
                  const SizedBox(height: 25),
                  TextFieldB(
                    paddingHeight: 18,
                    focusNode: passwordFocusnode,
                    controller: passwordController,
                    onChanged: (String password) {
                      bloc.add(ChangePassword(password: password));
                    },
                    obscureText: state.isObscureText,
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        bloc.add(IsObscureText());
                      },
                      child: state.isObscureText
                          ? const Icon(Icons.visibility_off, color: bGray)
                          : const Icon(Icons.visibility, color: bGray),
                    ),
                    errorText:
                        state.forms == Forms.invalid && state.password.isEmpty
                            ? 'Enter your password'
                            : '',
                  ),
                  const SizedBox(height: 30),
                  ButtonB(
                    heigh: 55,
                    text: "Log In",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: bWhite,
                    press: () {
                      bloc.add(PressToLogIn(
                        mobileFocus: mobileFocusnode,
                        passwordFocus: passwordFocusnode,
                      ));
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextB(
                        text: "Forgot Password",
                        fontSize: 14,
                        fontColor: bLightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextB(text: "Don't have any account?"),
                      InkWell(
                          onTap: () {
                            bloc.add(GoToRegisterFirstScreen());
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextB(
                              text: "Register",
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
