import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //디버그창 없애는거
      title: 'growth prediction',
      home: LoginSignupScreen(),
    );
  }
}
