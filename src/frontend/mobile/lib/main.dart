import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'name_needed',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/logosample.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                Image.asset(
                  'images/Name.jpeg',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                CupertinoButton(child: Text("문의하기"), onPressed: () {})
              ],
            )),
        body: SafeArea(child: ListView())); //여기부터다시시작
  }
}

