import 'package:flutter/material.dart';
import 'package:mobile/chart/bornChart1.dart';
import 'package:mobile/chart/bornChart2.dart';
import 'package:mobile/chart/bornChart3.dart';
import 'package:mobile/chart/bornChart4.dart';
import 'package:mobile/chart/bornChart5.dart';

class BornChartAll extends StatelessWidget {
  BornChartAll(
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
      return BornChart1(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 2) {
      return BornChart2(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 3) {
      return BornChart3(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else if (reportCount == 4) {
      return BornChart4(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    } else {
      return BornChart5(
        childName: childName,
        reportCount: reportCount,
        recJson: recJson,
        privJson: privJson,
      );
    }
  }
}
