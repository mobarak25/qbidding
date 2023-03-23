import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/features/app/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const LoginScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          return Body(
            child: Column(
              children: [
                const SizedBox(height: 178),
                Image.asset(
                  logoPng,
                  width: size.width * 0.6,
                ),
                const SizedBox(height: 25),
                const TextB(
                  text: "Please enter your e-mail\naddress and password",
                  fontSize: 20,
                  alignMent: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
