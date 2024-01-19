import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String? title;
  final String? hint;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final Widget? suffixWidget;
  final bool? isObscure;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  const TextFormFieldComponent(
      {super.key,
      this.controller,
      this.onChange,
      this.focusNode,
      this.isObscure,
      this.suffixWidget,
      this.borderColor,
      this.title,
      this.hint,
      this.hintStyle,
      this.titleStyle,
      this.validator});

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
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            // textAlign: TextAlign.start,
            cursorColor: borderColor ?? MyTheme.textFormBorder,
            obscureText: isObscure ?? false,
            focusNode: focusNode,
            onChanged: onChange,
            validator: validator,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50),
              suffixIcon: suffixWidget,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: borderColor ?? MyTheme.textFormBorder,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: hint ?? "email@address.com",
            ),
          )
        ],
      ),
    );
  }
}
