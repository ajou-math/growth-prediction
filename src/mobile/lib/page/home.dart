import 'package:flutter/material.dart';
import 'package:mobile/login/login.dart';
import 'package:mobile/page/current.dart';
import 'package:mobile/page/currentBmi.dart';
import 'package:mobile/page/exResult.dart';
import 'package:mobile/page/exercise.dart';
import 'package:mobile/page/food.dart';
import 'package:mobile/page/sleep.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/TitleLogo.png',
          width: 500.0,
          height: 150.0,
        ),
        backgroundColor: Color.fromARGB(255, 18, 79, 130),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginSignupScreen()));
            }, //로그아웃창 넣을것
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 130.0,
              child: const UserAccountsDrawerHeader(
                //const 지워야할수도
                accountName: Text('성명 : 윤기웅'),
                accountEmail: Text('생년월일 : 980528'),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 18, 79, 130),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.food_bank,
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              title: const Text('식단'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Food()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.run_circle,
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              title: const Text('운동량'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Exercise()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.alarm,
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              title: const Text('수면'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sleep()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.addchart_rounded,
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              title: const Text('현재 BMI'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Current()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_to_queue_outlined,
                color: Color.fromARGB(255, 24, 23, 23),
              ),
              title: const Text('이전 검사결과 상세보기'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ExResult()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
