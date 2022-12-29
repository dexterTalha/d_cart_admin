import 'package:d_cart_admin/screens/dashboard.dart';
import 'package:d_cart_admin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoute {
  static const String login = "/login";
  static const String dashboard = "/home/dashboard";
  static const String pos = "/home/pos";
  static final GoRouter router = GoRouter(
    initialLocation: login,
    // errorBuilder: ,
    routes: <GoRoute>[
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: dashboard,
        builder: (BuildContext context, GoRouterState state) {
          return DashboardScreen();
        },
      ),
    ],
  );
}
