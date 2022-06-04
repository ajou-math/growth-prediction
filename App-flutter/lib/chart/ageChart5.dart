import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeChart5 extends StatelessWidget {
  AgeChart5(
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
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 5]['privacyenterday']))}',
                            'measure': privJson[reportCount - 5]['privacytall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 4]['privacyenterday']))}',
                            'measure': privJson[reportCount - 4]['privacytall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 3]['privacyenterday']))}',
                            'measure': privJson[reportCount - 3]['privacytall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 2]['privacyenterday']))}',
                            'measure': privJson[reportCount - 2]['privacytall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 1]['privacyenterday']))}',
                            'measure': privJson[reportCount - 1]['privacytall']
                          },
                        ],
                      },
                      {
                        'id': 'Bar 2',
                        'data': [
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 5]['privacyenterday']))}',
                            'measure': privJson[reportCount - 5]
                                ['privacypredicttall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 4]['privacyenterday']))}',
                            'measure': privJson[reportCount - 4]
                                ['privacypredicttall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 3]['privacyenterday']))}',
                            'measure': privJson[reportCount - 3]
                                ['privacypredicttall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 2]['privacyenterday']))}',
                            'measure': privJson[reportCount - 2]
                                ['privacypredicttall']
                          },
                          {
                            'domain':
                                '${DateFormat('yyMMM').format(DateTime.parse(privJson[reportCount - 1]['privacyenterday']))}',
                            'measure': privJson[reportCount - 1]
                                ['privacypredicttall']
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
                    barValueFontSize: 7,
                    barValuePosition: BarValuePosition.outside,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '현재 키     ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        ),
                      ),
                      Text(
                        '예측 키',
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
