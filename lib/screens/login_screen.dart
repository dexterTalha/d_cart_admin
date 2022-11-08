import 'package:d_cart_admin/components/text_form_field.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:d_cart_admin/utils/responsive_builder.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = true;

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
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Signin",
            style: TextStyle(
              color: Colors.black,
              fontSize: 29,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "Welcome back",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          const TextFormFieldComponent(
            title: "Your Email",
            hint: "email@address.com",
          ),
          const SizedBox(height: 20),
          TextFormFieldComponent(
            title: "Password",
            hint: "6+ characters required",
            suffixWidget: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.visibility,
                color: MyTheme.textFormBorder,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            checkboxShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            value: isChecked,
            title: Text("Remember me"),
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            onChanged: (xyz) {
              setState(() {
                isChecked = xyz ?? false;
              });
            },
          )
        ],
      ),
    );
  }
}
