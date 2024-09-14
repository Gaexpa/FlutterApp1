import 'package:demo/pages/home.dart';
import 'package:demo/pages/wrappers/%20cooler_wrapper.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoolerWrapper(),
    );
  }
}
