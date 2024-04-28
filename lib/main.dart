import 'package:d_cart_admin/providers/dashboard_provider.dart';
import 'package:d_cart_admin/providers/login_provider.dart';
import 'package:d_cart_admin/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //important
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: "Poppins", useMaterial3: false),
        debugShowCheckedModeBanner: false,
        routerConfig: MyRoute.router,
        // home: LoginScreen(),
      ),
    );
  }
}
