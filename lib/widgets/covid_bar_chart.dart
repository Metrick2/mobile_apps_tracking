import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps_tracking/config/style.dart';

class CovidBarChart extends StatelessWidget {
  const CovidBarChart({Key? key, required this.covidCases}) : super(key: key);
  final List<double> covidCases;

  // const CovidBarChart({required this.covidCases});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Container(
          //   child: BarChart(
          //     BarChartData(
          //       maxY: 16.0,
          //       barTouchData: BarTouchData(enabled: false),
          //       titlesData: FlTitlesData(
          //         show: true,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
