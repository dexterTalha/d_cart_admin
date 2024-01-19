import 'package:d_cart_admin/components/dashboard_major_stats_block.dart';
import 'package:d_cart_admin/components/dashboard_minor_stats_block.dart';
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
import '../components/text_widget.dart';
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
    bool b = LoginProvider().getLoggedInUser();
    menuList = Constants.data.map((e) => MenuModel.fromJson(e)).toList();
    // for(Map<String, dynamic> map in Constants.data){
    //   MenuModel m = MenuModel.fromJson(map);
    //   menuList.add(m);
    // }

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
                  Expanded(child: mainWidget()),
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
                child: mainWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mainWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.maxFinite,
      width: double.maxFinite,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextWidget(
              text: "Welcome, John",
              size: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextWidget(
              text: "Hello, here you can manage your orders",
              size: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bar_chart),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextWidget(
                            text: "Dashboard order statistics",
                            size: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      //   value: "Overall Statistics",
                      //   items: ["Overall Statistics", "Today's Statistics"]
                      //       .map(
                      //         (e) => DropdownMenuItem(value: e, child: Text(e)),
                      //       )
                      //       .toList(),
                      //   onChanged: (st) {},
                      // ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      DashboardMajorStatsBlock(
                        index: 1,
                        color: MyTheme.dashboard_1,
                        title: "Unassigned orders",
                        count: "24",
                      ),
                      DashboardMajorStatsBlock(
                        index: 2,
                        color: MyTheme.dashboard_2,
                        title: "Ongoing orders",
                        count: "2",
                      ),
                      DashboardMajorStatsBlock(
                        index: 3,
                        color: MyTheme.dashboard_3,
                        title: "Preparing in stores",
                        count: "6",
                      ),
                      DashboardMajorStatsBlock(
                        index: 4,
                        color: MyTheme.dashboard_4,
                        title: "Picked up",
                        count: "2",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      DashboardMinorStatBlock(
                        index: 1,
                        backgroundColor: MyTheme.dashboard_3,
                        title: "Delivered",
                        count: "24",
                      ),
                      DashboardMinorStatBlock(
                        index: 2,
                        backgroundColor: MyTheme.dashboard_1,
                        title: "Cancelled",
                        count: "2",
                      ),
                      DashboardMinorStatBlock(
                        index: 3,
                        backgroundColor: MyTheme.dashboard_4,
                        title: "Payment Failed",
                        count: "6",
                      ),
                      DashboardMinorStatBlock(
                        index: 4,
                        backgroundColor: MyTheme.dashboard_2,
                        title: "Refunded",
                        count: "2",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
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
