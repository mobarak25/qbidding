import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/features/app/presentation/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(getIt<IFlutterNavigator>()),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          return Body(
            isFullScreen: true,
            child: Container(
              decoration: BoxDecoration(color: bDarkBlue.withOpacity(0.8)),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      whiteLogo,
                      width: size.width * 0.55,
                    ),
                    const SizedBox(height: 20),
                    TextB(
                      text: "Let's get started",
                      fontSize: size.width * 0.06,
                      fontColor: bExtraLightGray,
                    )
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
