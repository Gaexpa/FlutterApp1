import 'package:demo/navigations/app_navigation.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/wrappers/cooler_wrapper.dart';
import 'package:demo/pages/wrappers/main_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// 把右上角的demo條藏起來
      debugShowCheckedModeBanner: false,
      /// 設定router
      routerConfig: AppNavigation.router,
    );
  }
}
