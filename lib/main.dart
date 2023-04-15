import 'package:flutter/material.dart';
import 'package:loginwithgalary/provider/my_provider.dart';
import 'package:loginwithgalary/screen/Layout/home_layout.dart';
import 'package:loginwithgalary/screen/login/login-view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => MyProvider()),

        ],

        child: MyApp()),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginView.routeName,
      routes: {
        LoginView.routeName: (_) => LoginView(),
        HomeLayout.routeName:(_)=>HomeLayout(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}

