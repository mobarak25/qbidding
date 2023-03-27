import 'package:flutter/material.dart';
import 'package:qbidding/core/utils/asset_image.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.child,
    this.isFullScreen = false,
    this.horizontalPadding = 20,
  });
  final Widget child;
  final bool isFullScreen;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(siteBg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.only(
            top: isFullScreen ? 0 : MediaQuery.of(context).padding.top,
            bottom: isFullScreen ? 0 : MediaQuery.of(context).padding.bottom,
            left: isFullScreen ? 0 : horizontalPadding,
            right: isFullScreen ? 0 : horizontalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
