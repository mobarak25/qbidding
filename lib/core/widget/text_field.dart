import 'package:flutter/material.dart';
import 'package:qbidding/core/utils/colors.dart';
import 'package:qbidding/core/utils/text_styles.dart';
import 'package:qbidding/core/widget/text.dart';

class TextFieldB extends StatefulWidget {
  final String? hintText, fieldTitle, labelText, errorText, helperText;
  final double? paddingHeight, paddingWidth, height;
  final TextStyle? textStyle;
  final bool? isAccountType, isReadOnly;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final VoidCallback? onTouch;
  final Function onChanged;
  final Color? bgColor, hintColor;
  final bool isMandatory;

  const TextFieldB(
      {Key? key,
      this.hintText = "",
      this.fieldTitle = "",
      this.textStyle = bStyle,
      this.labelText,
      this.errorText = '',
      this.helperText = '',
      this.isAccountType = false,
      this.maxLines = 1,
      this.maxLength,
      this.controller,
      required this.focusNode,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.paddingHeight = 5,
      this.paddingWidth = 15,
      this.onTouch,
      this.height,
      this.bgColor,
      required this.onChanged,
      this.isReadOnly = false,
      this.isMandatory = false,
      this.hintColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextField();
  }
}

class _TextField extends State<TextFieldB> {
  @override
  Widget build(BuildContext context) {
    widget.focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldTitle != "")
          Row(
            children: [
              TextB(
                text: widget.fieldTitle!,
                textStyle: bStyle,
                fontColor: bDark,
              ),
              const SizedBox(width: 5),
              if (widget.isMandatory)
                const TextB(
                  text: '*',
                  textStyle: bStyle,
                  fontColor: bRed,
                ),
            ],
          ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            boxShadow: widget.focusNode.hasFocus && widget.isAccountType!
                ? [
                    BoxShadow(
                      color: const Color(0XFF000000).withOpacity(0.18),
                      offset: const Offset(5, 5), //(x,y)
                      blurRadius: 7,
                    ),
                    BoxShadow(
                      color: const Color(0XFFFFFFFF).withOpacity(0.18),
                      offset: const Offset(-3, -5), //(x,y)
                      blurRadius: 12,
                    )
                  ]
                : null,
          ),
          child: TextField(
            readOnly: widget.isReadOnly!,
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType!,
            onTap: widget.onTouch,
            onChanged: (value) {
              widget.onChanged(value);
            },
            textInputAction: TextInputAction.next,
            cursorColor: bGray,
            style: widget.textStyle!,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign!,
            decoration: InputDecoration(
              counterText: widget.maxLength == null ? '' : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.paddingWidth!,
                vertical: widget.paddingHeight!,
              ),
              suffixIcon: widget.suffixIcon,
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: bGray, fontSize: 14),
              hintText: widget.hintText!,
              hintStyle: TextStyle(color: widget.hintColor),
              fillColor: widget.focusNode.hasFocus && widget.isAccountType!
                  ? const Color(0XFFF2F2F2)
                  : widget.bgColor ?? Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: widget.isAccountType!
                    ? const BorderSide(color: Colors.transparent)
                    : const BorderSide(color: bGray),
                borderRadius: BorderRadius.circular(7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bExtraLightGray),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
        if (widget.errorText != "")
          TextB(
            text: widget.errorText!,
            fontSize: 12,
            fontColor: bRed,
          ),
      ],
    );
  }
}
