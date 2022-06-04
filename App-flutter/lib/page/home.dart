import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/chart/ageChartAll.dart';
import 'package:mobile/chart/bornChartAll.dart';
import 'package:mobile/login/login.dart';
import 'package:mobile/network/GetComm.dart';
import 'package:mobile/page/current.dart';
import 'package:mobile/page/exResult.dart';
import 'package:mobile/sleep.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' as g;

class MyHome extends StatelessWidget {
  MyHome({
    required this.childName,
    required this.childNumber,
    required this.parentName,
    required this.parentNumber,
    required this.childId,
    required this.reportCount,
    required this.recJson,
    required this.privJson,
  });
  final String childId;
  final String childName;
  final String childNumber;
  final String parentName;
  final String parentNumber;
  final int reportCount;
  final dynamic recJson;
  final dynamic privJson;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/icons/TitleLogo.png',
            width: 500.0,
            height: 150.0,
          ),
          backgroundColor: Color.fromARGB(255, 18, 79, 130),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        LoginSignupScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Text(
              '$childName님의 검사결과입니다',
              style: const TextStyle(
                color: Color.fromARGB(255, 18, 79, 130),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            AgeChartAll(
              childName: childName,
              reportCount: reportCount,
              recJson: recJson,
              privJson: privJson,
            ),
            BornChartAll(
              childName: childName,
              reportCount: reportCount,
              recJson: recJson,
              privJson: privJson,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
          ),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
          ),
          unselectedItemColor: Color.fromARGB(255, 113, 113, 113),
          selectedItemColor: Color.fromARGB(255, 113, 113, 113),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
              ),
              label: '수면',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.addchart_rounded,
              ),
              label: '현재 BMI',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_queue_outlined,
              ),
              label: '검사결과 상세보기',
            ),
          ],
          onTap: (int index) async {
            switch (index) {
              case 0:
                GetComm getcomm = GetComm();
                getcomm.setChildName(childId);
                http.Response responseSleep = await getcomm.sendGetRec();
                if (responseSleep.statusCode != 200) {
                  print('something wrong in sleep');
                }
                var jsonData = responseSleep.bodyBytes;
                var parsingData =
                    jsonDecode(utf8.decode(jsonData))[0]['recommendsleep'];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sleep(
                      sleep: parsingData,
                    ),
                  ),
                );
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Current()));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExResult(
                            childName: childName,
                            childNumber: childNumber,
                            parentName: parentName,
                            parentNumber: parentNumber,
                            reportCount: reportCount,
                            recJson: recJson,
                            privJson: privJson)));
                break;
              default:
            }
          },
        ),
      ),
    );
  }
}
