import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:flutter/material.dart';

class DrawerHeadingText extends StatelessWidget {
  final String? title;
  const DrawerHeadingText({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 15),
      child: Text(
        (title ?? "").toUpperCase(),
        style: const TextStyle(
          color: MyTheme.drawerSubHeadingColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
