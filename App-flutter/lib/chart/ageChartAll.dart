import 'package:flutter/material.dart';
import 'package:mobile/chart/ageChart1.dart';
import 'package:mobile/chart/ageChart2.dart';
import 'package:mobile/chart/ageChart3.dart';
import 'package:mobile/chart/ageChart4.dart';
import 'package:mobile/chart/ageChart5.dart';

class AgeChartAll extends StatelessWidget {
  AgeChartAll(
      {Key? key,
      required this.childName,
      required this.reportCount,
      required this.recJson,
      required this.privJson})
      : super(key: key);
  final String childName;
  final int reportCount;
  final dynamic recJson;
  final dynamic privJson;
  @override
  Widget build(BuildContext context) {
    if (reportCount == 1) {
      return AgeChart1(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 2) {
      return AgeChart2(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 3) {
      return AgeChart3(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 4) {
      return AgeChart4(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else {
      return AgeChart5(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    }
  }
}
