import 'package:d_cart_admin/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/my_routes.dart';
import '../utils/responsive_builder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      primary: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (_scaffoldKey.currentState != null) {
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.closeDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            } else {
              print("hi");
            }
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: ResponsiveBuilder(
        mobile: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: SizedBox(
              width: size.width * 0.7,
              child: drawerWidget(),
            ),
          ),
          body: logoutButton(),
        ),
        tablet: webDashboard(),
        web: webDashboard(),
      ),
    );
  }

  Widget webDashboard() {
    return Row(
      children: [
        Expanded(flex: 1, child: drawerWidget()),
        Expanded(
          flex: 14,
          child: logoutButton(),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await LoginProvider().logout();
          if (mounted) {
            context.go(MyRoute.login);
          }
        },
        child: Text("Logout"),
      ),
    );
  }

  Widget drawerWidget() {
    return Container(
      color: Colors.red,
      // width: 100,
    );
  }
}
