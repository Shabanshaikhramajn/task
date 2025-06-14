import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/pages/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         fontFamily: 'PPTelegraf',
        useMaterial3: true,
      ),

      home: LoginScreen()
    );
  }
}
