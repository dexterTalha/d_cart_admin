import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String? title;
  final String? hint;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final Widget? suffixWidget;
  const TextFormFieldComponent({Key? key, this.suffixWidget, this.borderColor, this.title, this.hint, this.hintStyle, this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Your Email",
            style: titleStyle ?? const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 15),
          Container(
            height: 45,
            child: TextFormField(
              textAlign: TextAlign.start,
              cursorColor: borderColor ?? MyTheme.textFormBorder,
              decoration: InputDecoration(
                suffixIcon: suffixWidget,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: borderColor ?? MyTheme.textFormBorder,
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: hint ?? "email@address.com",
              ),
            ),
          )
        ],
      ),
    );
  }
}
