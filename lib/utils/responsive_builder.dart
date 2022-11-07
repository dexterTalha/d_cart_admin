import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;
  const ResponsiveBuilder({Key? key, required this.mobile, required this.tablet, required this.web}) : super(key: key);

  static bool isOnlyWeb(BuildContext context) => kIsWeb;
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 640;
  static bool isTab(BuildContext context) => MediaQuery.of(context).size.width >= 641 && MediaQuery.of(context).size.width <= 1007;
  static bool isWeb(BuildContext context) => MediaQuery.of(context).size.width >= 1008;
  static bool isMobileButWeb(BuildContext context) => isMobile(context) && kIsWeb;
  static bool isTabButWeb(BuildContext context) => isTab(context) && kIsWeb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, size) {
      if (size.maxWidth >= 1008) {
        return web;
      } else if (size.maxWidth < 1008 && size.maxWidth >= 641) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
