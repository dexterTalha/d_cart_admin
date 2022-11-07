import 'package:d_cart_admin/utils/responsive_builder.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: loginForm(),
        tablet: Container(
          color: Colors.green,
        ),
        web: Container(
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget loginForm() {
    return Container(
      color: Colors.red,
    );
  }
}
