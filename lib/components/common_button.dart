import 'package:flutter/material.dart';

import '../utils/mytheme.dart';

class CommonButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final String? text;
  final TextStyle? textStyle;
  const CommonButton({
    Key? key,
    this.borderRadius,
    this.textStyle,
    this.buttonColor,
    this.horizontalPadding,
    this.onPressed,
    this.text,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? MyTheme.btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0, horizontal: horizontalPadding ?? 0),
          child: Text(
            text ?? "Login",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
