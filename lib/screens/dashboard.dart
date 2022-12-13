import 'package:d_cart_admin/providers/dashboard_provider.dart';
import 'package:d_cart_admin/providers/login_provider.dart';
import 'package:d_cart_admin/utils/constants.dart';
import 'package:d_cart_admin/utils/mytheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/drawer_widget.dart';
import '../components/profile_menu_widget.dart';
import '../model/menu_model.dart';
import '../utils/my_routes.dart';
import '../utils/responsive_builder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final User? user = FirebaseAuth.instance.currentUser;
  List<MenuModel> menuList = [];

  @override
  void initState() {
    bool b = true; //LoginProvider().getLoggedInUser();
    menuList = Constants.data.map((e) => MenuModel.fromJson(e)).toList();
    // for(Map<String, dynamic> map in Constants.data){
    //   MenuModel m = MenuModel.fromJson(map);
    //   menuList.add(m);
    // }
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
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return Scaffold(
          primary: true,
          body: ResponsiveBuilder(
            mobile: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: DrawerWidget(
                    isExpanded: true,
                    menuList: const [],
                    onTap: () {
                      _scaffoldKey.currentState!.closeDrawer();
                      ref.toggleMobileExpansion(value: false);
                    },
                  ),
                ),
              ),
              onDrawerChanged: (b) => ref.toggleMobileExpansion(value: b),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_scaffoldKey.currentState != null) {
                          if (_scaffoldKey.currentState!.isDrawerOpen) {
                            _scaffoldKey.currentState!.closeDrawer();
                          } else {
                            _scaffoldKey.currentState!.openDrawer();
                          }
                          ref.toggleMobileExpansion(value: _scaffoldKey.currentState!.isDrawerOpen);
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            (ref.isMobileDrawerOpen ? Icons.close_rounded : Icons.menu),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: logoutButton()),
                ],
              ),
            ),
            tablet: webDashboard(ref.isDrawerExpanded, size, ref),
            web: webDashboard(ref.isDrawerExpanded, size, ref),
          ),
        );
      },
    );
  }

  Widget webDashboard(bool expanded, Size size, DashboardProvider ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/png/logo.png', height: 50),
            ),
            GestureDetector(
              onTap: () {
                ref.toggleExpansion();
              },
              child: Icon(
                ref.isDrawerExpanded ? Icons.close_rounded : Icons.menu,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ProfileMenuWidget(),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              DrawerWidget(isExpanded: expanded, menuList: menuList),
              Expanded(
                child: logoutButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return Center(
      child: Text("DASHBOARD"),
    );
  }

  Widget drawerWidget() {
    return Container(
      color: Colors.red,
      // width: 100,
    );
  }
}
