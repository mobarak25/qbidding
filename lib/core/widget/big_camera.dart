import 'package:flutter/material.dart';
import 'package:qbidding/core/utils/asset_image.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/widget/text.dart';

class BigCamera extends StatelessWidget {
  const BigCamera(
      {Key? key,
      required this.press,
      this.tittle = '',
      this.subtitle = '',
      this.errorText = ''})
      : super(key: key);

  final VoidCallback press;
  final String tittle, subtitle;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: const Color(0XFFEFEFEF),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: press,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: bExtraLightGray),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(vactorImagePng),
                  const SizedBox(height: 7),
                  TextB(
                    text: tittle,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  TextB(
                    text: subtitle,
                    fontSize: 14,
                    fontColor: bDarkGray,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (errorText != '')
          TextB(
            text: errorText,
            fontSize: 12,
            fontColor: bRed,
          )
      ],
    );
  }
}
