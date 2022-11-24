import 'package:d_cart_admin/components/common_button.dart';
import 'package:d_cart_admin/components/custom_background.dart';
import 'package:d_cart_admin/components/text_form_field.dart';
import 'package:d_cart_admin/providers/login_provider.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:d_cart_admin/utils/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../utils/my_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = true;
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();

  StateMachineController? machineController;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  late Size size;
  late LoginProvider loginProvider;
  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    _emailFocus.addListener(emailFocusListener);
    _passFocus.addListener(passFocusListener);

    bool b = loginProvider.getLoggedInUser();
    print("current user $b");
    if (b) {
      // Navigator.pushNamedAndRemoveUntil(context, MyRoute.dashboard, (route) => false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(MyRoute.dashboard);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.removeListener(emailFocusListener);
    _passFocus.removeListener(passFocusListener);
    // _emailFocus.dispose();
    _emailController.dispose();
    // _passFocus.dispose();
    _passController.dispose();
    super.dispose();
  }

  void emailFocusListener() {
    isChecking?.change(_emailFocus.hasFocus);
  }

  void passFocusListener() {
    isHandsUp?.change(_passFocus.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: CustomBackground(
          fit: BoxFit.fitHeight,
          asset: "assets/png/login_portrait_background.jpg",
          child: loginForm,
        ),
        tablet: desktopLogin,
        web: desktopLogin,
      ),
    );
  }

  Widget get desktopLogin => CustomBackground(
        fit: BoxFit.fill,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: loginForm,
            ),
          ],
        ),
      );

  Widget get loginForm => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 30,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
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
                    Visibility(
                      visible: true,
                      child: Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          child: RiveAnimation.asset(
                            "assets/rive_animation/login_anim.riv",
                            stateMachines: const ["Login Machine"],
                            // artboard: "assets/rive_animation/login_anim.riv",
                            onInit: (board) {
                              machineController = StateMachineController.fromArtboard(board, "Login Machine");

                              if (machineController == null) {
                                print("hi");
                                return;
                              }
                              print("bye");
                              board.addController(machineController!);
                              isChecking = machineController?.findInput("isChecking");
                              numLook = machineController?.findInput("numLook");
                              isHandsUp = machineController?.findInput("isHandsUp");
                              trigSuccess = machineController?.findInput("trigSuccess");
                              trigFail = machineController?.findInput("trigFail");
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldComponent(
                      title: "Your Email",
                      focusNode: _emailFocus,
                      hint: "email@address.com",
                      controller: _emailController,
                      onChange: (st) {
                        numLook?.change(st.length.toDouble() * 2);
                      },
                    ),
                    const SizedBox(height: 20),
                    Consumer<LoginProvider>(
                      builder: (_, ref, child) => TextFormFieldComponent(
                        isObscure: ref.obscure,
                        focusNode: _passFocus,
                        title: "Password",
                        controller: _passController,
                        hint: "6+ characters required",
                        suffixWidget: InkWell(
                          splashColor: Colors.white,
                          hoverColor: Colors.white,
                          onTap: () {
                            ref.toggleObscure();
                            isHandsUp?.change(ref.obscure);
                          },
                          child: Icon(
                            !ref.obscure ? Icons.visibility_off : Icons.visibility,
                            color: MyTheme.textFormBorder,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer<LoginProvider>(
                      builder: (_, ref, child) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        value: ref.checked,
                        checkColor: Colors.white,
                        activeColor: MyTheme.textFormBorder,
                        title: const Text("Remember me"),
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        onChanged: (checked) {
                          ref.toggleCheck(checked ?? false);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer<LoginProvider>(
                      builder: (_, ref, child) => CommonButton(
                        text: ref.isLoading ? "Loading..." : "Login",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        onPressed: ref.isLoading
                            ? null
                            : () async {
                                bool isLogin = await ref.login(_emailController.text.trim(), _passController.text);

                                trigFail?.change(!isLogin);

                                if (isLogin && mounted) {
                                  context.go(MyRoute.dashboard);
                                }
                              },
                        borderRadius: 8,
                        verticalPadding: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
