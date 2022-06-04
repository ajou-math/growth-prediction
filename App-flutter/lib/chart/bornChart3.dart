import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BornChart3 extends StatefulWidget {
  BornChart3(
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
  State<BornChart3> createState() => _BornChart3State();
}

class _BornChart3State extends State<BornChart3> {
  int? age1;
  int? age2;
  int? age3;

  @override
  void initState() {
    super.initState();
    age1 = (int.parse(DateFormat('yy')
            .format(DateTime.parse(widget.privJson[0]['privacyenterday'])))) -
        (int.parse(widget.privJson[0]['privacybirth'].substring(0, 2))) +
        1;
    age2 = (int.parse(DateFormat('yy')
            .format(DateTime.parse(widget.privJson[1]['privacyenterday'])))) -
        (int.parse(widget.privJson[1]['privacybirth'].substring(0, 2))) +
        1;
    age3 = (int.parse(DateFormat('yy')
            .format(DateTime.parse(widget.privJson[2]['privacyenterday'])))) -
        (int.parse(widget.privJson[2]['privacybirth'].substring(0, 2))) +
        1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: [
                      {
                        'id': 'Bar 1',
                        'data': [
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[0]['privacyenterday']))}',
                            'measure': age1
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[1]['privacyenterday']))}',
                            'measure': age2
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[2]['privacyenterday']))}',
                            'measure': age3
                          },
                        ],
                      },
                      {
                        'id': 'Bar 2',
                        'data': [
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[0]['privacyenterday']))}',
                            'measure': widget.privJson[0]['privacybornage']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[1]['privacyenterday']))}',
                            'measure': widget.privJson[1]['privacybornage']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(widget.privJson[2]['privacyenterday']))}',
                            'measure': widget.privJson[2]['privacybornage']
                          },
                        ],
                      },
                    ],
                    minimumPaddingBetweenLabel: 1,
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 10,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => id == 'Bar 1'
                        ? Colors.green.shade300
                        : id == 'Bar 2'
                            ? Colors.green.shade600
                            : Colors.green.shade900,
                    barValue: (barData, index) => '${barData['measure']}',
                    showBarValue: true,
                    barValueFontSize: 12,
                    barValuePosition: BarValuePosition.outside,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '나이     ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        ),
                      ),
                      Text(
                        '골연령',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
