import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qbidding/core/ioc/global.dart';
import 'package:qbidding/core/navigator/iflutter_navigator.dart';
import 'package:qbidding/core/widget/body.dart';
import 'package:qbidding/core/widget/text.dart';
import 'package:qbidding/features/app/domain/repositories/api_repo.dart';
import 'package:qbidding/features/app/domain/repositories/local_storage_repo.dart';
import 'package:qbidding/features/app/presentation/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(getIt<ApiRepo>(), getIt<LocalStorageRepo>(),
          getIt<IFlutterNavigator>()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final size = MediaQuery.of(context).size;
          final bloc = context.read<HomeBloc>();

          return Body(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TextB(text: 'Home'),
                  GestureDetector(
                    onTap: () {
                      bloc.add(LogOut());
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextB(text: "Log Out"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
