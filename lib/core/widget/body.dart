import 'package:flutter/material.dart';
import 'package:qbidding/core/utils/asset_image.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.child,
    this.isFullScreen = false,
  });
  final Widget child;
  final bool isFullScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: isFullScreen ? 0 : MediaQuery.of(context).padding.top,
          bottom: isFullScreen ? 0 : MediaQuery.of(context).padding.bottom,
        ),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(siteBg), fit: BoxFit.cover)),
        child: child,
      ),
    );
  }
}
