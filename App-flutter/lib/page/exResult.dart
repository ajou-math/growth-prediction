import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:intl/intl.dart';
import 'package:mobile/page/exResultSep.dart';
import 'package:mobile/page/home.dart';

class ExResult extends StatelessWidget {
  const ExResult({
    Key? key,
    required this.childName,
    required this.childNumber,
    required this.parentName,
    required this.parentNumber,
    required this.reportCount,
    required this.recJson,
    required this.privJson,
  }) : super(key: key);
  final String childName;
  final String childNumber;
  final String parentName;
  final String parentNumber;
  final int reportCount;
  final dynamic recJson;
  final dynamic privJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/TitleLogo.png',
          width: 500.0,
          height: 150.0,
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 18, 79, 130),
      ),
      body: ListView.builder(
        itemCount: reportCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40.0,
              color: Color.fromARGB(255, 183, 183, 183),
              child: GestureDetector(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$childName님의 ${DateFormat('yyyy년MM일').format(DateTime.parse(privJson[index]['privacyenterday']))} 검사결과 보러가기     ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_circle_right_outlined,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  g.Get.to(ExResultSep(
                      childName: childName,
                      childNumber: childNumber,
                      parentName: parentName,
                      parentNumber: parentNumber,
                      index: index,
                      recJson: recJson,
                      privJson: privJson));
                },
              ),
            ),
          );
        },
        // separatorBuilder: (BuildContext context, int index) => const Divider(
        //   height: 10.0,
        //   color: Colors.blue,
        // ),
      ),
    );
  }
}
