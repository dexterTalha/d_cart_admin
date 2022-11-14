import 'package:d_cart_admin/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/my_routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    bool b = LoginProvider().getLoggedInUser();
    print("current user $b");
    if (!b) {
      // Navigator.pushNamedAndRemoveUntil(context, MyRoute.dashboard, (route) => false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(MyRoute.login);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await LoginProvider().logout();
            if (mounted) {
              context.go(MyRoute.login);
            }
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
