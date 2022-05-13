import 'package:flutter/material.dart';
import 'login/login.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //디버그창 없애는거
      title: 'growth prediction',
      home: LoginSignupScreen(),
    );
  }
}
